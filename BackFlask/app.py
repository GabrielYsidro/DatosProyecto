
from flask import Flask, render_template as template
from flask import request, jsonify, send_from_directory
import os
import sqlite3
from flask_cors import CORS
from datetime import datetime

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:5173"}})

FOLDER_SUBIDA = 'subidas'
app.config['FOLDER_SUBIDA'] = FOLDER_SUBIDA

DATABASE = 'db/app.db'

if not os.path.exists(FOLDER_SUBIDA):
    os.makedirs(FOLDER_SUBIDA)
    
def conectarDB():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn

#Endpoint para subir archivos y devolver URL de descarga
@app.route('/upload', methods=['POST'])
def uploadFile():
    if 'file' not in request.files:
        return jsonify({'success': False, 'message': 'No se encontró archivo en la solicitud'}), 400
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'success': False, 'message': 'No se seleccionó ningún archivo'}), 400
    
    file_path = os.path.join(app.config['FOLDER_SUBIDA'], file.filename)
    file.save(file_path)
    
    file_url = f'http://localhost:5000/files/{file.filename}'
    return jsonify({'success': True, 'message': 'Archivo subido exitosamente', 'file_url': file_url}), 200


#Endpoint para descargar archivos
@app.route('/files/<filename>')
def serve_file(filename):
    # Servir el archivo desde el directorio 'subidas'
    return send_from_directory(app.config['FOLDER_SUBIDA'], filename)

@app.route('/')
def index():
    return template('index.tpl')

@app.route('/api/<recurso>',methods=['GET'])
def obtenerRecurso(recurso):    
    conn = conectarDB()
    cursor = conn.cursor()
    try:
        recursos = cursor.execute(f"SELECT id, nombre FROM {recurso}").fetchall()
        # Convertir el resultado en una lista de diccionarios
        resultado = [{"id" : row["id"], "nombre": row["nombre"]} for row in recursos]
        print(resultado)  # Verificar el contenido
    except sqlite3.Error as e:
        conn.close()
        return jsonify({"error": str(e)}), 400
    conn.close()
    return jsonify(resultado)

#Ruta para postear datos de cliente
@app.route('/clienteDB', methods=['POST'])
def clienteDB():
    data = request.get_json()
    if not data:
        return jsonify({"error": "No se enviaron datos"}), 400
    
    print("Datos recibidos:", data)
    
    conn = conectarDB()
    cursor = conn.cursor()
    
    name = data.get('name')
    email = data.get('email')
    contra = data.get('password')
    
    summary = data.get('resumen')
    desc = data.get('descripcion')
    id_pro = data.get('proyecto')
    doc = data.get('uploadedFileUrl')
    ruc = data.get('ruc')
    
    response = ""
    
    try:
        
        #Crear usuario y usuario_cliente
        cursor.execute("INSERT INTO usuarios (nombre, correo, contrasenha) VALUES (?, ?, ?)", (name,email,contra))
        last_id = cursor.lastrowid
        cursor.execute("INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES (?, ?)", (ruc, last_id))
        
        #Crear documento
        cursor.execute("INSERT INTO documentos (url_doc) VALUES (?)", (doc,))
        last_id = cursor.lastrowid
        
        #Crear incidencia
        cursor.execute("INSERT INTO incidencias (resumen, descripcion, fecha_envio, id_proyecto, id_documento) VALUES (?, ?, DATETIME('now'), ?, ?)", (summary, desc, id_pro,last_id))
        conn.commit()
        response = {"message": "Data inserted successfully"}
        print("PASE")
        
    except sqlite3.Error as e:
        conn.rollback()
        print(str(e))
        print("ERROR")
    finally:
        conn.close()
    
    return jsonify(response)

@app.route('/api/incidencias/<int:id>')
def get_incidencia(id):
    conn =conectarDB()
    incidencia = conn.execute('SELECT * FROM incidencias WHERE id = ?', (id,)).fetchone()
    conn.close()
    
    if incidencia is None:
        return jsonify({'error' : 'Incidencia no hallada'}), 404
    
    print(dict(incidencia))
    return jsonify(dict(incidencia))


if __name__ == '__main__':
    app.run(debug=True)
