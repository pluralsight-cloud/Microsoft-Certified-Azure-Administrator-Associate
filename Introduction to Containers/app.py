from flask import Flask
import socket

# Initialize flask app
app = Flask(__name__)

# Create default route for flask app
@app.route('/')
def hello_world():
    hostname = socket.gethostname()
    return f'Hello, World! This is running on host: {hostname}'

if __name__ == '__main__':
    app.run()
