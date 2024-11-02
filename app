from flask import Flask, render_template, request, redirect, url_for, flash, session
from controllers.controller import loginController

app = Flask(__name__)
app.secret_key = '4321'
app.register_blueprint(loginController)

publicRoutes=["controller.login", "login.login"]

@app.before.request
def funcao():
    if request.endpoint == publicRoutes:
        return
    if "username" in session:
        return redirect(url_for("controller.login"))
    return redirect(url_for("login.login"))

@app.errorhadler(404)
def page_not_found(e):
    flash("Ocorreu um erro")
    return render_template('error.html', errorCode = 404, errorMessage = "Página não encontrada"), 404

@app.errorhadler(403)
def forbidden_error(e):
    flash("Ocorreu um erro")
    return render_template('error.html', errorCode = 403, errorMessage = "Acesso negado, faça login primeiro"), 403

@app.errorhadler(401)
def unauthorized_error(e):
    flash("Ocorreu um erro")
    return render_template('error.html', errorCode = 401, errorMessage = "Acesso não autorizado, credenciais inválidas"), 401

@app.errorhadler(500)
def internal_server_error(e):
    flash("Ocorreu um erro")
    app.logger.error(f"Erro 500: {e}")
    return render_template('error.html', errorCode = 500, errorMessage = "Erro interno do servidor"), 500

if __name__ == '__main__':
    app.run(debug=True)
