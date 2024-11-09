
from flask import Flask, render_template as template

app = Flask(__name__)

@app.route('/caca')
def home():
    return "<h1> Los peques</h1>"

@app.route('/')
def index():
    return template('index.tpl')

if __name__ == '__main__':
    app.run(debug=True)

