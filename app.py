from bottle import Bottle, run, template

app = Bottle()

@app.route('/')
def home():
    return template('index')

if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True)