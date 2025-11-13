from flask import Flask, jsonify
import os
import datetime

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "message": "Hello World from CI/CD Pipeline!",
        "status": "running",
        "timestamp": datetime.datetime.now().isoformat(),
        "version": "1.0.0"
    })

@app.route('/health')
def health():
    return jsonify({
        "status": "healthy",
        "service": "demo-app",
        "timestamp": datetime.datetime.now().isoformat()
    }), 200

@app.route('/info')
def info():
    return jsonify({
        "app": "Demo CI/CD Application",
        "framework": "Flask",
        "python_version": os.sys.version,
        "endpoints": ["/", "/health", "/info"]
    })

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)
