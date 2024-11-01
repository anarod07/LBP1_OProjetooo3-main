from flask import Flask, render_template, request, redirect, url_for, flash, session
from controllers.controller import loginController

app = Flask(__name__)
app.secret_key = '4321'
app.register_blueprint(loginController)

publicRoutes=["register.index", "login.login"]

@app.before.request
def funcao():
    if request.endpoint == publicRoutes:
        return
    if "username" in session:
        return redirect(url_for("register.index"))
    return redirect(url_for("login.login"))

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
    else:
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
