
from flask import Flask, render_template as template
from flask import request, jsonify, send_from_directory
import os
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

FOLDER_SUBIDA = 'subidas'
app.config['FOLDER_SUBIDA'] = FOLDER_SUBIDA


if not os.path.exists(FOLDER_SUBIDA):
    os.makedirs(FOLDER_SUBIDA)

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

if __name__ == '__main__':
    app.run(debug=True)

