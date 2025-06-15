from flask import Flask
from routes.proxy import proxy_bp
from flask_cors import CORS

app = Flask(__name__)
app.register_blueprint(proxy_bp)
CORS(app) 
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
