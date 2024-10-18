from flask import Flask, render_template, request
from controller import vamos_arrasar

app = Flask(__name__)
app.register_blueprint(vamos_arrasar)

@app.route('/')
def index():
    return "Olá, Mundo!"

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template('register.html')
    elif request.method == 'POST':
        username = request.form ['username']
        password = request.form ['password']

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template('index.html')
    elif request.method == 'POST':
        username = request.form ['username']
        password = request.form ['password']


if __name__ == '__main__':
    app.run(debug=True)
