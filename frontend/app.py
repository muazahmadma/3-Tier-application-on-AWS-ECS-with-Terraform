from flask import Flask, render_template, request, redirect, url_for
import requests
import os

app = Flask(__name__)

BACKEND_URL = os.environ.get("BACKEND_URL")
@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        quote = request.form["quote"]
        author = request.form["author"]
        requests.post(f"{BACKEND_URL}/api/quotes", json={"quote": quote, "author": author})
        return redirect(url_for("index"))
    else:
        quotes = requests.get(f"{BACKEND_URL}/api/quotes").json()
        return render_template("index.html", quotes=quotes)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002)
