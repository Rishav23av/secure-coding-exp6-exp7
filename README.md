# Secure Coding Lab — Experiments 6 & 7 (DAST)

**Student:** Rishav &nbsp;|&nbsp; **Roll No:** 2301730245 &nbsp;|&nbsp; **B.Tech CSE (AI & ML) — Sec D**

Dynamic application security testing labs: automated scanning with OWASP ZAP and
manual HTTP interception/manipulation with Burp Suite.

## Contents

### [exp6-owasp-zap/](exp6-owasp-zap/) — Dynamic Analysis with OWASP ZAP (Spider & Active Scan)
Deployed OWASP Juice Shop in an isolated Docker network and ran a ZAP spider +
active scan via the ZAP API.
- `Exp6_OWASP_ZAP_Report_Rishav_2301730245.pdf` — lab report
- `ascan_and_report.sh` — scan driver (active scan + report export via ZAP API)
- `evidence/zap_report.html`, `zap_report.md` — exported ZAP reports
- `evidence/alerts_full.json`, `alerts_unique.json`, `alerts_summary.json` — raw alert data
- `evidence/deployment_confirmation.txt` — target deployment proof

**Result:** 210 alerts — **1 High (SQL Injection, CWE-89)**, 66 Medium, 8 Low, 135 Informational.

### [exp7-burp-suite/](exp7-burp-suite/) — HTTP Request/Response Interception & Manipulation with Burp Suite
A deliberately vulnerable Flask target and three intercept-and-modify scenarios.
- `Exp7_Burp_Interception_Report_Rishav_2301730245.pdf` — lab report
- `vulnerable_shop.py` — vulnerable target application
- `evidence/manipulations.txt` — captured original vs. modified request/response pairs

**Manipulations:** (1) hidden form field (price 800→1), (2) session cookie (role user→admin),
(3) request header (X-Forwarded-For bypass 403→200).

## Tooling
OWASP ZAP 2.17.0, Burp Suite Community, Python 3 / Flask, Docker (isolated targets).
