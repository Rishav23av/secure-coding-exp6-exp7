#!/bin/bash
Z="http://127.0.0.1:8090"
T="http://juiceshop:3000"
EV="/Users/rishav./Downloads/neti-sahu/exp6-zap/evidence"
mkdir -p "$EV"

echo "=== starting ACTIVE SCAN ==="
AID=$(curl -s "$Z/JSON/ascan/action/scan/?url=$T&recurse=true&inScopeOnly=false" | sed 's/[^0-9]*\([0-9]*\).*/\1/')
echo "ascan scanId=$AID"

# poll up to ~14 minutes
for i in $(seq 1 170); do
  st=$(curl -s "$Z/JSON/ascan/view/status/?scanId=$AID" | sed 's/[^0-9]*\([0-9]*\).*/\1/')
  echo "  ascan $st%  (poll $i)"
  [ "$st" = "100" ] && { echo "ACTIVE SCAN COMPLETE"; break; }
  sleep 5
done

echo "=== pulling alerts summary ==="
curl -s "$Z/JSON/alert/view/alertsSummary/?baseurl=$T" | tee "$EV/alerts_summary.json"; echo
echo "=== full alerts (JSON) ==="
curl -s "$Z/JSON/alert/view/alerts/?baseurl=$T&start=0&count=9999" > "$EV/alerts_full.json"
python3 - "$EV/alerts_full.json" <<'PY'
import json,sys,collections
d=json.load(open(sys.argv[1]))
al=d.get('alerts',[])
print("total alerts:",len(al))
by=collections.Counter(a['risk'] for a in al)
for k in ["High","Medium","Low","Informational"]:
    print(f"  {k}: {by.get(k,0)}")
# unique by name+risk
seen={}
for a in al:
    key=(a['alert'],a['risk'])
    seen.setdefault(key, {'name':a['alert'],'risk':a['risk'],'cwe':a.get('cweid'),'wasc':a.get('wascid'),'count':0,'url':a.get('url'),'param':a.get('param'),'desc':a.get('description','')[:300],'solution':a.get('solution','')[:300]})
    seen[key]['count']+=1
print("UNIQUE alert types:",len(seen))
json.dump(list(seen.values()), open(sys.argv[1].replace('alerts_full','alerts_unique'),'w'), indent=1)
PY

echo "=== generating ZAP HTML + MD reports via API ==="
curl -s "$Z/OTHER/core/other/htmlreport/" > "$EV/zap_report.html"
curl -s "$Z/OTHER/core/other/mdreport/" > "$EV/zap_report.md"
echo "report sizes:"; ls -la "$EV"/zap_report.* "$EV"/alerts_*.json 2>/dev/null
echo "ASCAN_REPORT_DONE"
