
from flask import Flask, render_template as template
from flask import request, jsonify, send_from_directory
import os
import sqlite3
from flask_cors import CORS

app = Flask(__name__)

CORS(app, resources={
    r"/*": {
        "origins": "http://localhost:5173",
        "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
        "allow_headers": ["Content-Type", "Authorization"]
    }
})

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
        recursos = cursor.execute(f"SELECT * FROM {recurso}").fetchall()
        #Obener los nombres de las columnas
        column_names = [description[0] for description in cursor.description]
        # Convertir el resultado en una lista de diccionarios
        resultado = [dict(zip(column_names, row)) for row in recursos]
        print(resultado)  # Verificar el contenido
    except sqlite3.Error as e:
        conn.close()
        return jsonify({"error": str(e)}), 400
    conn.close()
    return jsonify(resultado)

@app.route('/clienteDB', methods=['POST'])
def clienteDB():
    data = request.get_json()
    if not data:
        return jsonify({"error": "No se enviaron datos"}), 400
    
    print("Datos recibidos:", data)
    
    conn = conectarDB()
    cursor = conn.cursor()
    
    summary = data.get('resumen')
    desc = data.get('descripcion')
    id_pro = data.get('proyecto')
    doc = data.get('uploadedFileUrl')
    
    type = data.get('tipo')

    response = ""
    
    
    try:
        
        #Crear documento
        cursor.execute("INSERT INTO documentos (url_doc, tipo) VALUES (?, ?)", (doc, type))
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


@app.route('/api/incidencias', methods=['GET'])
def obtenerIncidencias():
    # Obtener parámetros de consulta
    id_proyecto = request.args.get('id_proyecto', type=int)
    id_departamento = request.args.get('id_departamento', type=int)

    conn = conectarDB()
    cursor = conn.cursor()

    try:
        query = """
            SELECT i.id, i.resumen, i.descripcion, i.fecha_envio, 
            p.nombre AS proyecto, d.nombre AS departamento
            FROM incidencias i
            LEFT JOIN proyectos p ON i.id_proyecto = p.id
            LEFT JOIN departamentos d ON i.id_departamento = d.id
            WHERE (i.id_proyecto = ? OR ? IS NULL)
            AND (i.id_departamento = ? OR ? IS NULL)
        """
        params = (id_proyecto, id_proyecto, id_departamento, id_departamento)
        incidencias = cursor.execute(query, params).fetchall()

        resultado = [
            {
                "id": row["id"],
                "resumen": row["resumen"],
                "descripcion": row["descripcion"],
                "fecha_envio": row["fecha_envio"],
                "proyecto": row["proyecto"],
                "departamento": row["departamento"],
            }
            for row in incidencias
        ]
    except sqlite3.Error as e:
        conn.close()
        return jsonify({"error": str(e)}), 400
    conn.close()
    return jsonify(resultado)

@app.route('/api/incidencias/<int:id>', methods=['GET', 'PUT'])
def incidencia_detalle(id):
    conn = conectarDB()
    cursor = conn.cursor()

    if request.method == 'GET':
        incidencia = cursor.execute(""" 
            SELECT i.*, GROUP_CONCAT(e.nombre, ', ') AS tags
            FROM incidencias i
            LEFT JOIN etiquetas_incidencias ei ON i.id = ei.id_incidencia
            LEFT JOIN etiquetas e ON ei.id_etiqueta = e.id
            WHERE i.id = ?
            GROUP BY i.id
        """, (id,)).fetchone()

        if incidencia is None:
            return jsonify({'error': 'Incidencia no encontrada'}), 404

        resultado = dict(incidencia)
        resultado['tags'] = [t.strip() for t in (resultado['tags'] or '').split(',')]
        return jsonify(resultado)

    elif request.method == 'PUT':
        data = request.get_json()

        # Actualizar incidencia
        keys = ["id_proyecto", "id_departamento", "id_estado", "id_prioridad"]
        valores = {key: data.get(key) for key in keys if key in data}
        set_clause = ", ".join([f"{key} = ?" for key in valores.keys()])
        valores_lista = list(valores.values())
        valores_lista.append(id)

        try:
    
            # Actualizar la incidencia
            cursor.execute(f"UPDATE incidencias SET {set_clause}, fecha_actu = DATETIME('now') WHERE id = ?", valores_lista)
           
            # Actualizar las etiquetas
            tags = data.get('tags', [])
            print("Etiquetas recibidas:", tags)  # Verifica que los tags sean los ID correctos
            
            
            # Eliminar las etiquetas antiguas
            cursor.execute("DELETE FROM etiquetas_incidencias WHERE id_incidencia = ?", (id,))
            
            # Insertar las nuevas etiquetas
            cursor.executemany("INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (?, ?)", [(id, tag) for tag in tags])
            
            conn.commit()
        except sqlite3.Error as e:
            conn.rollback()
            return jsonify({'error': str(e)}), 400
        finally:
            conn.close()

        return jsonify({'message': 'Incidencia actualizada correctamente'}), 200

@app.route('/api/dev/<int:devid>', methods=['GET'])
def obtener_incidencias_por_desarrollador(devid):
    conn = conectarDB()
    cursor = conn.cursor()

    try:
        query = """
            SELECT i.id, i.resumen, i.descripcion, i.fecha_envio, i.fecha_actu
            FROM incidencias i
            JOIN incidencia_developer id ON i.id = id.id_incidencia
            WHERE id.id_developer = ?
        """
        cursor.execute(query, (devid,))
        incidencias = cursor.fetchall()

        resultado = [
            {
                "id": row[0],
                "resumen": row[1],
                "descripcion": row[2],
                "fecha_envio": row[3],
                "fecha_actu": row[4]
            }
            for row in incidencias
        ]

    except sqlite3.Error as e:
        conn.close()
        return jsonify({"error": str(e)}), 400

    conn.close()
    return jsonify(resultado)


if __name__ == '__main__':
    app.run(debug=True)

