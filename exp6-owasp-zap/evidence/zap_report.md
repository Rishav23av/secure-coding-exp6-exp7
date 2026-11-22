# ZAP Scanning Report

ZAP by [Checkmarx](https://checkmarx.com/).


## Summary of Alerts

| Risk Level | Number of Alerts |
| --- | --- |
| High | 1 |
| Medium | 4 |
| Low | 3 |
| Informational | 2 |




## Insights

| Level | Reason | Site | Description | Statistic |
| --- | --- | --- | --- | --- |
| Low | Warning |  | ZAP warnings logged - see the zap.log file for details | 90    |
| Info | Informational |  | Percentage of network failures | 1 % |
| Info | Informational | http://juiceshop:3000 | Percentage of responses with status code 2xx | 52 % |
| Info | Informational | http://juiceshop:3000 | Percentage of responses with status code 3xx | 6 % |
| Info | Exceeded Low | http://juiceshop:3000 | Percentage of responses with status code 4xx | 36 % |
| Info | Informational | http://juiceshop:3000 | Percentage of responses with status code 5xx | 4 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type application/javascript | 10 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type application/json | 15 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type font/woff | 2 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type font/woff2 | 2 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type image/avif | 34 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type image/png | 4 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type image/x-icon | 2 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type text/css | 2 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type text/html | 13 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with content type text/plain | 6 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with method GET | 97 % |
| Info | Informational | http://juiceshop:3000 | Percentage of endpoints with method POST | 2 % |
| Info | Informational | http://juiceshop:3000 | Count of total endpoints | 46    |
| Info | Informational | http://juiceshop:3000 | Percentage of slow responses | 2 % |







## Alerts

| Name | Risk Level | Number of Instances |
| --- | --- | --- |
| SQL Injection | High | 1 |
| Content Security Policy (CSP) Header Not Set | Medium | 5 |
| Cross-Domain Misconfiguration | Medium | Systemic |
| Missing Anti-clickjacking Header | Medium | 1 |
| Session ID in URL Rewrite | Medium | Systemic |
| Private IP Disclosure | Low | 1 |
| Timestamp Disclosure - Unix | Low | 4 |
| X-Content-Type-Options Header Missing | Low | 3 |
| Modern Web Application | Informational | 3 |
| User Agent Fuzzer | Informational | Systemic |




## Alert Detail



### [ SQL Injection ](https://www.zaproxy.org/docs/alerts/40018/)



##### High (Low)

### Description

SQL injection may be possible.

* URL: http://juiceshop:3000/rest/products/search%3Fq=%2527%2528
  * Node Name: `http://juiceshop:3000/rest/products/search (q)`
  * Method: `GET`
  * Parameter: `q`
  * Attack: `'(`
  * Evidence: `HTTP/1.1 500 Internal Server Error`
  * Other Info: ``


Instances: 1

### Solution

Do not trust client side input, even if there is client side validation in place.
In general, type check all data on the server side.
If the application uses JDBC, use PreparedStatement or CallableStatement, with parameters passed by '?'
If the application uses ASP, use ADO Command Objects with strong type checking and parameterized queries.
If database Stored Procedures can be used, use them.
Do *not* concatenate strings into queries in the stored procedure, or use 'exec', 'exec immediate', or equivalent functionality!
Do not create dynamic SQL queries using simple string concatenation.
Escape all data received from the client.
Apply an 'allow list' of allowed characters, or a 'deny list' of disallowed characters in user input.
Apply the principle of least privilege by using the least privileged database user possible.
In particular, avoid using the 'sa' or 'db-owner' database users. This does not eliminate SQL injection, but minimizes its impact.
Grant the minimum database access that is necessary for the application.

### Reference


* [ https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html ](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)


#### CWE Id: [ 89 ](https://cwe.mitre.org/data/definitions/89.html)


#### WASC Id: 19

#### Source ID: 1

### [ Content Security Policy (CSP) Header Not Set ](https://www.zaproxy.org/docs/alerts/10038/)



##### Medium (High)

### Description

Content Security Policy (CSP) is an added layer of security that helps to detect and mitigate certain types of attacks, including Cross Site Scripting (XSS) and data injection attacks. These attacks are used for everything from data theft to site defacement or distribution of malware. CSP provides a set of standard HTTP headers that allow website owners to declare approved sources of content that browsers should be allowed to load on that page — covered types are JavaScript, CSS, HTML frames, fonts, images and embeddable objects such as Java applets, ActiveX, audio and video files.

* URL: http://juiceshop:3000
  * Node Name: `http://juiceshop:3000`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: ``
  * Other Info: ``
* URL: http://juiceshop:3000/
  * Node Name: `http://juiceshop:3000/`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: ``
  * Other Info: ``
* URL: http://juiceshop:3000/ftp
  * Node Name: `http://juiceshop:3000/ftp`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: ``
  * Other Info: ``
* URL: http://juiceshop:3000/sitemap.xml
  * Node Name: `http://juiceshop:3000/sitemap.xml`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: ``
  * Other Info: ``
* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=polling&t=09pd33xr&sid=49qjLsnaK7UNzov1AAAC
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,t,transport)(40)`
  * Method: `POST`
  * Parameter: ``
  * Attack: ``
  * Evidence: ``
  * Other Info: ``


Instances: 5

### Solution

Ensure that your web server, application server, load balancer, etc. is configured to set the Content-Security-Policy header.

### Reference


* [ https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CSP ](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CSP)
* [ https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html ](https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html)
* [ https://www.w3.org/TR/CSP/ ](https://www.w3.org/TR/CSP/)
* [ https://w3c.github.io/webappsec-csp/ ](https://w3c.github.io/webappsec-csp/)
* [ https://web.dev/articles/csp ](https://web.dev/articles/csp)
* [ https://caniuse.com/#feat=contentsecuritypolicy ](https://caniuse.com/#feat=contentsecuritypolicy)
* [ https://content-security-policy.com/ ](https://content-security-policy.com/)


#### CWE Id: [ 693 ](https://cwe.mitre.org/data/definitions/693.html)


#### WASC Id: 15

#### Source ID: 3

### [ Cross-Domain Misconfiguration ](https://www.zaproxy.org/docs/alerts/10098/)



##### Medium (Medium)

### Description

Web browser data loading may be possible, due to a Cross Origin Resource Sharing (CORS) misconfiguration on the web server.

* URL: http://juiceshop:3000
  * Node Name: `http://juiceshop:3000`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `Access-Control-Allow-Origin: *`
  * Other Info: `The CORS misconfiguration on the web server permits cross-domain read requests from arbitrary third party domains, using unauthenticated APIs on this domain. Web browser implementations do not permit arbitrary third parties to read the response from authenticated APIs, however. This reduces the risk somewhat. This misconfiguration could be used by an attacker to access data that is available in an unauthenticated manner, but which uses some other form of security, such as IP address white-listing.`
* URL: http://juiceshop:3000/assets/public/favicon_js.ico
  * Node Name: `http://juiceshop:3000/assets/public/favicon_js.ico`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `Access-Control-Allow-Origin: *`
  * Other Info: `The CORS misconfiguration on the web server permits cross-domain read requests from arbitrary third party domains, using unauthenticated APIs on this domain. Web browser implementations do not permit arbitrary third parties to read the response from authenticated APIs, however. This reduces the risk somewhat. This misconfiguration could be used by an attacker to access data that is available in an unauthenticated manner, but which uses some other form of security, such as IP address white-listing.`
* URL: http://juiceshop:3000/robots.txt
  * Node Name: `http://juiceshop:3000/robots.txt`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `Access-Control-Allow-Origin: *`
  * Other Info: `The CORS misconfiguration on the web server permits cross-domain read requests from arbitrary third party domains, using unauthenticated APIs on this domain. Web browser implementations do not permit arbitrary third parties to read the response from authenticated APIs, however. This reduces the risk somewhat. This misconfiguration could be used by an attacker to access data that is available in an unauthenticated manner, but which uses some other form of security, such as IP address white-listing.`
* URL: http://juiceshop:3000/rolldown-runtime-kqx1xuJ_.js
  * Node Name: `http://juiceshop:3000/rolldown-runtime-kqx1xuJ_.js`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `Access-Control-Allow-Origin: *`
  * Other Info: `The CORS misconfiguration on the web server permits cross-domain read requests from arbitrary third party domains, using unauthenticated APIs on this domain. Web browser implementations do not permit arbitrary third parties to read the response from authenticated APIs, however. This reduces the risk somewhat. This misconfiguration could be used by an attacker to access data that is available in an unauthenticated manner, but which uses some other form of security, such as IP address white-listing.`
* URL: http://juiceshop:3000/styles.css
  * Node Name: `http://juiceshop:3000/styles.css`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `Access-Control-Allow-Origin: *`
  * Other Info: `The CORS misconfiguration on the web server permits cross-domain read requests from arbitrary third party domains, using unauthenticated APIs on this domain. Web browser implementations do not permit arbitrary third parties to read the response from authenticated APIs, however. This reduces the risk somewhat. This misconfiguration could be used by an attacker to access data that is available in an unauthenticated manner, but which uses some other form of security, such as IP address white-listing.`

Instances: Systemic


### Solution

Ensure that sensitive data is not available in an unauthenticated manner (using IP address white-listing, for instance).
Configure the "Access-Control-Allow-Origin" HTTP header to a more restrictive set of domains, or remove all CORS headers entirely, to allow the web browser to enforce the Same Origin Policy (SOP) in a more restrictive manner.

### Reference


* [ https://vulncat.fortify.com/en/detail?category=HTML5&subcategory=Overly%20Permissive%20CORS%20Policy ](https://vulncat.fortify.com/en/detail?category=HTML5&subcategory=Overly%20Permissive%20CORS%20Policy)


#### CWE Id: [ 264 ](https://cwe.mitre.org/data/definitions/264.html)


#### WASC Id: 14

#### Source ID: 3

### [ Missing Anti-clickjacking Header ](https://www.zaproxy.org/docs/alerts/10020/)



##### Medium (Medium)

### Description

The response does not protect against 'ClickJacking' attacks. It should include either Content-Security-Policy with 'frame-ancestors' directive or X-Frame-Options.

* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=polling&t=09pd33xr&sid=49qjLsnaK7UNzov1AAAC
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,t,transport)(40)`
  * Method: `POST`
  * Parameter: `x-frame-options`
  * Attack: ``
  * Evidence: ``
  * Other Info: ``


Instances: 1

### Solution

Modern Web browsers support the Content-Security-Policy and X-Frame-Options HTTP headers. Ensure one of them is set on all web pages returned by your site/app.
If you expect the page to be framed only by pages on your server (e.g. it's part of a FRAMESET) then you'll want to use SAMEORIGIN, otherwise if you never expect the page to be framed, you should use DENY. Alternatively consider implementing Content Security Policy's "frame-ancestors" directive.

### Reference


* [ https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options ](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options)


#### CWE Id: [ 1021 ](https://cwe.mitre.org/data/definitions/1021.html)


#### WASC Id: 15

#### Source ID: 3

### [ Session ID in URL Rewrite ](https://www.zaproxy.org/docs/alerts/3/)



##### Medium (High)

### Description

URL rewrite is used to track user session ID. The session ID may be disclosed via cross-site referer header. In addition, the session ID might be stored in browser history or server logs.

* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=polling&t=09pd4rqg&sid=49qjLsnaK7UNzov1AAAC
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,t,transport)`
  * Method: `GET`
  * Parameter: `sid`
  * Attack: ``
  * Evidence: `49qjLsnaK7UNzov1AAAC`
  * Other Info: ``
* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=websocket&sid=49qjLsnaK7UNzov1AAAC
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,transport)`
  * Method: `GET`
  * Parameter: `sid`
  * Attack: ``
  * Evidence: `49qjLsnaK7UNzov1AAAC`
  * Other Info: ``
* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=websocket&sid=ujyeiJoCL3Kb3xdqAAAD
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,transport)`
  * Method: `GET`
  * Parameter: `sid`
  * Attack: ``
  * Evidence: `ujyeiJoCL3Kb3xdqAAAD`
  * Other Info: ``
* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=polling&t=09pd33xr&sid=49qjLsnaK7UNzov1AAAC
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,t,transport)(40)`
  * Method: `POST`
  * Parameter: `sid`
  * Attack: ``
  * Evidence: `49qjLsnaK7UNzov1AAAC`
  * Other Info: ``
* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=polling&t=09qh3hrw&sid=ujyeiJoCL3Kb3xdqAAAD
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,t,transport)(40)`
  * Method: `POST`
  * Parameter: `sid`
  * Attack: ``
  * Evidence: `ujyeiJoCL3Kb3xdqAAAD`
  * Other Info: ``

Instances: Systemic


### Solution

For secure content, put session ID in a cookie. To be even more secure consider using a combination of cookie and URL rewrite.

### Reference


* [ https://seclists.org/webappsec/2002/q4/111 ](https://seclists.org/webappsec/2002/q4/111)


#### CWE Id: [ 598 ](https://cwe.mitre.org/data/definitions/598.html)


#### WASC Id: 13

#### Source ID: 3

### [ Private IP Disclosure ](https://www.zaproxy.org/docs/alerts/2/)



##### Low (Medium)

### Description

A private IP (such as 10.x.x.x, 172.x.x.x, 192.168.x.x) or an Amazon EC2 private hostname (for example, ip-10-0-56-78) has been found in the HTTP response body. This information might be helpful for further attacks targeting internal systems.

* URL: http://juiceshop:3000/rest/admin/application-configuration
  * Node Name: `http://juiceshop:3000/rest/admin/application-configuration`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `192.168.99.100:3000`
  * Other Info: `192.168.99.100:3000
192.168.99.100:4200
`


Instances: 1

### Solution

Remove the private IP address from the HTTP response body. For comments, use JSP/ASP/PHP comment instead of HTML/JavaScript comment which can be seen by client browsers.

### Reference


* [ https://datatracker.ietf.org/doc/html/rfc1918 ](https://datatracker.ietf.org/doc/html/rfc1918)


#### CWE Id: [ 497 ](https://cwe.mitre.org/data/definitions/497.html)


#### WASC Id: 13

#### Source ID: 3

### [ Timestamp Disclosure - Unix ](https://www.zaproxy.org/docs/alerts/10096/)



##### Low (Low)

### Description

A timestamp was disclosed by the application/web server. - Unix

* URL: http://juiceshop:3000/rest/admin/application-configuration
  * Node Name: `http://juiceshop:3000/rest/admin/application-configuration`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `1969196030`
  * Other Info: `1969196030, which evaluates to: 2032-05-26 14:53:50.`
* URL: http://juiceshop:3000/rest/admin/application-configuration
  * Node Name: `http://juiceshop:3000/rest/admin/application-configuration`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `1970691216`
  * Other Info: `1970691216, which evaluates to: 2032-06-12 22:13:36.`
* URL: http://juiceshop:3000/rest/products/search%3Fq=
  * Node Name: `http://juiceshop:3000/rest/products/search (q)`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `1969196030`
  * Other Info: `1969196030, which evaluates to: 2032-05-26 14:53:50.`
* URL: http://juiceshop:3000/rest/products/search%3Fq=
  * Node Name: `http://juiceshop:3000/rest/products/search (q)`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `1970691216`
  * Other Info: `1970691216, which evaluates to: 2032-06-12 22:13:36.`


Instances: 4

### Solution

Manually confirm that the timestamp data is not sensitive, and that the data cannot be aggregated to disclose exploitable patterns.

### Reference


* [ https://cwe.mitre.org/data/definitions/200.html ](https://cwe.mitre.org/data/definitions/200.html)


#### CWE Id: [ 497 ](https://cwe.mitre.org/data/definitions/497.html)


#### WASC Id: 13

#### Source ID: 3

### [ X-Content-Type-Options Header Missing ](https://www.zaproxy.org/docs/alerts/10021/)



##### Low (Medium)

### Description

The Anti-MIME-Sniffing header X-Content-Type-Options was not set to 'nosniff'. This allows older versions of Internet Explorer and Chrome to perform MIME-sniffing on the response body, potentially causing the response body to be interpreted and displayed as a content type other than the declared content type. Current (early 2014) and legacy versions of Firefox will use the declared content type (if one is set), rather than performing MIME-sniffing.

* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=polling&t=09pd4rqg&sid=49qjLsnaK7UNzov1AAAC
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,t,transport)`
  * Method: `GET`
  * Parameter: `x-content-type-options`
  * Attack: ``
  * Evidence: ``
  * Other Info: `This issue still applies to error type pages (401, 403, 500, etc.) as those pages are often still affected by injection issues, in which case there is still concern for browsers sniffing pages away from their actual content type.
At "High" threshold this scan rule will not alert on client or server error responses.`
* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=polling&t=09pbdw7a
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,t,transport)`
  * Method: `GET`
  * Parameter: `x-content-type-options`
  * Attack: ``
  * Evidence: ``
  * Other Info: `This issue still applies to error type pages (401, 403, 500, etc.) as those pages are often still affected by injection issues, in which case there is still concern for browsers sniffing pages away from their actual content type.
At "High" threshold this scan rule will not alert on client or server error responses.`
* URL: http://juiceshop:3000/socket.io/%3FEIO=4&transport=polling&t=09pd33xr&sid=49qjLsnaK7UNzov1AAAC
  * Node Name: `http://juiceshop:3000/socket.io/ (EIO,sid,t,transport)(40)`
  * Method: `POST`
  * Parameter: `x-content-type-options`
  * Attack: ``
  * Evidence: ``
  * Other Info: `This issue still applies to error type pages (401, 403, 500, etc.) as those pages are often still affected by injection issues, in which case there is still concern for browsers sniffing pages away from their actual content type.
At "High" threshold this scan rule will not alert on client or server error responses.`


Instances: 3

### Solution

Ensure that the application/web server sets the Content-Type header appropriately, and that it sets the X-Content-Type-Options header to 'nosniff' for all web pages.
If possible, ensure that the end user uses a standards-compliant and modern web browser that does not perform MIME-sniffing at all, or that can be directed by the web application/web server to not perform MIME-sniffing.

### Reference


* [ https://learn.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/compatibility/gg622941(v=vs.85) ](https://learn.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/compatibility/gg622941(v=vs.85))
* [ https://owasp.org/www-community/Security_Headers ](https://owasp.org/www-community/Security_Headers)


#### CWE Id: [ 693 ](https://cwe.mitre.org/data/definitions/693.html)


#### WASC Id: 15

#### Source ID: 3

### [ Modern Web Application ](https://www.zaproxy.org/docs/alerts/10109/)



##### Informational (Medium)

### Description

The application appears to be a modern web application. If you need to explore it automatically then the Client Spider may well be more effective than the standard one.

* URL: http://juiceshop:3000
  * Node Name: `http://juiceshop:3000`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `<script>
    window.addEventListener("load", function(){
      window.cookieconsent.initialise({
        "palette": {
          "popup": { "background": "var(--theme-primary)", "text": "var(--theme-text)" },
          "button": { "background": "var(--theme-accent)", "text": "var(--theme-text)" }
        },
        "theme": "classic",
        "position": "bottom-right",
        "content": { "message": "This website uses fruit cookies to ensure you get the juiciest tracking experience.", "dismiss": "Me want it!", "link": "But me wait!", "href": "https://www.youtube.com/watch?v=9PnbKL3wuH4" }
      })});
  </script>`
  * Other Info: `No links have been found while there are scripts, which is an indication that this is a modern web application.`
* URL: http://juiceshop:3000/
  * Node Name: `http://juiceshop:3000/`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `<script>
    window.addEventListener("load", function(){
      window.cookieconsent.initialise({
        "palette": {
          "popup": { "background": "var(--theme-primary)", "text": "var(--theme-text)" },
          "button": { "background": "var(--theme-accent)", "text": "var(--theme-text)" }
        },
        "theme": "classic",
        "position": "bottom-right",
        "content": { "message": "This website uses fruit cookies to ensure you get the juiciest tracking experience.", "dismiss": "Me want it!", "link": "But me wait!", "href": "https://www.youtube.com/watch?v=9PnbKL3wuH4" }
      })});
  </script>`
  * Other Info: `No links have been found while there are scripts, which is an indication that this is a modern web application.`
* URL: http://juiceshop:3000/sitemap.xml
  * Node Name: `http://juiceshop:3000/sitemap.xml`
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `<script>
    window.addEventListener("load", function(){
      window.cookieconsent.initialise({
        "palette": {
          "popup": { "background": "var(--theme-primary)", "text": "var(--theme-text)" },
          "button": { "background": "var(--theme-accent)", "text": "var(--theme-text)" }
        },
        "theme": "classic",
        "position": "bottom-right",
        "content": { "message": "This website uses fruit cookies to ensure you get the juiciest tracking experience.", "dismiss": "Me want it!", "link": "But me wait!", "href": "https://www.youtube.com/watch?v=9PnbKL3wuH4" }
      })});
  </script>`
  * Other Info: `No links have been found while there are scripts, which is an indication that this is a modern web application.`


Instances: 3

### Solution

This is an informational alert and so no changes are required.

### Reference




#### Source ID: 3

### [ User Agent Fuzzer ](https://www.zaproxy.org/docs/alerts/10104/)



##### Informational (Medium)

### Description

Check for differences in response based on fuzzed User Agent (eg. mobile sites, access as a Search Engine Crawler). Compares the response statuscode and the hashcode of the response body with the original response.

* URL: http://juiceshop:3000/assets
  * Node Name: `http://juiceshop:3000/assets`
  * Method: `GET`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)`
  * Evidence: ``
  * Other Info: ``
* URL: http://juiceshop:3000/assets
  * Node Name: `http://juiceshop:3000/assets`
  * Method: `GET`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)`
  * Evidence: ``
  * Other Info: ``
* URL: http://juiceshop:3000/assets
  * Node Name: `http://juiceshop:3000/assets`
  * Method: `GET`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)`
  * Evidence: ``
  * Other Info: ``
* URL: http://juiceshop:3000/assets/public
  * Node Name: `http://juiceshop:3000/assets/public`
  * Method: `GET`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)`
  * Evidence: ``
  * Other Info: ``
* URL: http://juiceshop:3000/assets/public
  * Node Name: `http://juiceshop:3000/assets/public`
  * Method: `GET`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)`
  * Evidence: ``
  * Other Info: ``

Instances: Systemic


### Solution



### Reference


* [ https://owasp.org/www-project-web-security-testing-guide/ ](https://owasp.org/www-project-web-security-testing-guide/)



#### Source ID: 1


