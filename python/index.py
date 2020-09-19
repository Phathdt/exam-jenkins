from flask import Flask
import os

app = Flask(__name__)

app_version = os.environ['APP_VERSION']
host_name = os.environ['HOST_NAME']

@app.route("/")

def hello():
    return f"Hello World! {app_version} - {host_name}"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
