import random
from datetime import datetime, timedelta


def generar_inserts_comentarios():
    comentarios = []
    ahora = datetime.now()
    analista_ids = [1, 2, 3] 
    developer_ids = list(range(1, 148)) 

    for _ in range(100): 
        contenido = f"Comentario de prueba {_ + 1}"
        fecha = ahora - timedelta(days=random.randint(0, 30))
        fecha_str = fecha.strftime('%Y-%m-%d %H:%M:%S')
        id_analista = random.choice(analista_ids)
        id_developer = random.choice(developer_ids)
        comentarios.append(
            f"INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) "
            f"VALUES ('{contenido}', '{fecha_str}', {id_analista}, {id_developer});"
        )

    with open("insert_comentarios.sql", "w") as file:
        file.write("\n".join(comentarios))

    print("Archivo 'insert_comentarios.sql' generado con éxito.")
    

def generar_inserts_documento_comentarios():
    documento_comentarios = []
    total_comentarios = 100 
    total_documentos = 50

    for _ in range(100): 
        id_documento = random.choice(range(1, total_documentos * 2, 2)) 
        id_comentario = random.randint(1, total_comentarios) 
        documento_comentarios.append(
            f"INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES ({id_documento}, {id_comentario});"
        )


    with open("insert_documento_comentarios.sql", "w") as file:
        file.write("\n".join(documento_comentarios))

    print("Archivo 'insert_documento_comentarios.sql' generado con éxito.")
    
def generar_inserts_etiquetas():
    etiquetas = [
        (1, 'Urgente'),
        (2, 'Bug'),
        (3, 'Mejora'),
        (4, 'Produccion'),
        (5, 'Documentación')
    ]
    
    inserts_etiquetas = [
        f"INSERT INTO etiquetas (id, nombre) VALUES ({id}, '{nombre}');"
        for id, nombre in etiquetas
    ]
    

    with open("insert_etiquetas.sql", "w") as file:
        file.write("\n".join(inserts_etiquetas))
    
    print("Archivo 'insert_etiquetas.sql' generado con éxito.")
    

generar_inserts_etiquetas()
generar_inserts_documento_comentarios()
generar_inserts_comentarios()