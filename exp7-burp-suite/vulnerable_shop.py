"""
vulnerable_shop.py — deliberately insecure target app for the Burp Suite lab.

Three flaws are demonstrated by intercepting and manipulating HTTP traffic:
  (1) HIDDEN FORM FIELD: /checkout trusts a hidden "price" field from the client.
  (2) SESSION COOKIE:    "role" is stored in a plaintext cookie and trusted with
                         NO server-side validation, so changing it grants admin.
  (3) REQUEST HEADER:    /admin grants "internal" access when X-Forwarded-For
                         looks like 127.0.0.1 — a spoofable header trust.

Run:  python vulnerable_shop.py   (listens on 127.0.0.1:5000)
"""
from flask import Flask, request, make_response, redirect

app = Flask(__name__)

PRODUCTS = {"laptop": 800, "phone": 500}


@app.route("/")
def home():
    # Server knows the real price, but the form submits it in a HIDDEN field.
    return """
    <h2>Mini Shop</h2>
    <form action="/checkout" method="POST">
      Product: laptop
      <input type="hidden" name="product" value="laptop">
      <input type="hidden" name="price" value="800">   <!-- hidden, trusted -->
      <button type="submit">Buy</button>
    </form>
    """


@app.route("/checkout", methods=["POST"])
def checkout():
    product = request.form.get("product", "")
    # FLAW 1: the server trusts the client-supplied hidden price field.
    price = request.form.get("price", "0")
    return f"Order placed: {product} charged at ${price}\n"


@app.route("/login")
def login():
    # Issue a plaintext, unsigned role cookie (default: normal user).
    resp = make_response(redirect("/dashboard"))
    resp.set_cookie("role", "user")
    return resp


@app.route("/dashboard")
def dashboard():
    # FLAW 2: role is read straight from the cookie with no server-side check.
    role = request.cookies.get("role", "guest")
    if role == "admin":
        return "ADMIN DASHBOARD: all users, all orders, settings.\n"
    return f"User dashboard (role={role}). Admin area hidden.\n"


@app.route("/admin")
def admin():
    # FLAW 3: trusts the X-Forwarded-For header to decide "internal" access.
    xff = request.headers.get("X-Forwarded-For", "")
    if xff.startswith("127.0.0.1"):
        return "ADMIN PANEL (internal access granted via X-Forwarded-For).\n"
    return ("403 Forbidden: admin panel is internal-only.\n", 403)


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000)
