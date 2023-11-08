from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# Função auxiliar para criar a conexão e o cursor
def get_db_connection():
    db = mysql.connector.connect(
        host="localhost",
        user="luan",
        password="Br32_forte",
        database="aula_13_10"
    )
    cursor = db.cursor()
    return db, cursor

@app.route('/')
def index():
    db, cursor = get_db_connection()
    
    # Consulta para buscar os setores do banco de dados
    cursor.execute("SELECT id, nome FROM setor")
    setores = cursor.fetchall()

    # Consulta para buscar os cargos do banco de dados
    cursor.execute("SELECT id, nome FROM cargos")
    cargos = cursor.fetchall()

    cursor.close()
    db.close()

    return render_template('index.html', setores=setores, cargos=cargos)

@app.route('/add', methods=['POST'])
def add_funcionario():
    primeiro_nome = request.form['primeiro_nome']
    sobrenome = request.form['sobrenome']
    data_admissao = request.form['data_admissao']
    status_funcionario = request.form['status_funcionario']
    id_setor = request.form['id_setor']
    id_cargo = request.form['id_cargo']

    db, cursor = get_db_connection()
    cursor.execute("INSERT INTO funcionarios (primeiro_nome, sobrenome, data_admissao, status_funcionario, id_setor, id_cargo) VALUES (%s, %s, %s, %s, %s, %s)",
                   (primeiro_nome, sobrenome, data_admissao, status_funcionario, id_setor, id_cargo))
    db.commit()
    cursor.close()
    db.close()

    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
