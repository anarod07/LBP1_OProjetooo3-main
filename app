from flask import Flask, render_template, request, redirect, url_for, flash, session
from controller import vamos_arrasar

app = Flask(__name__)
app.secret_key = 'chave_secreta'

userData = {"username": "usuario", "password": "senha"}

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form ['username']
        password = request.form ['password']
        if username == userData ['username'] and password == ['password']:
            username = username
            return redirect(url_for('dashboard'))
        else:
            flash("Nome de usuário ou senha incorretos")
            return render_template('index.html')
        
@app.route('/dashboard')
def dashboard():
    if 'username' in session:
        return f'Bem-vindo, {session['username']}'
    else:\
        return redirect(url_for(login))
    
@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for(login))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template('register.html')
    elif request.method == 'POST':
        username = request.form ['username']
        password = request.form ['password']


if __name__ == '__main__':
    app.run(debug=True)
