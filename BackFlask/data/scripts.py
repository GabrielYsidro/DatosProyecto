from faker import Faker
from datetime import datetime, timedelta
import random
import string

fake = Faker()

def generar_contraseña(longitud=12):
    caracteres = string.ascii_letters + string.digits + "!#$%&()*+,-./:;<=>?@[\\]^_`{|}~"
    contraseña = ''.join(random.choice(caracteres) for _ in range(longitud))
    return contraseña

def llenar_miembros():
    id = 1
    contenido = ''
    with open('miembros.txt', mode='r', newline='', encoding='utf-8') as archivo:
        for fila in archivo:
            #Se divide cada parte
            fila = fila.strip().split('::')
            print(fila)
            #Se pone cada miembro
            nombres = fila[0]
            apellidos = fila[1]
            codigo = fila[2]
            #Construyes la instruccion
            tmp = f"INSERT INTO miembros (id, nombres, apellidos, codigo) VALUES ({id}, '{nombres}', '{apellidos}', {codigo});\n"
            contenido = contenido + tmp
            id = id + 1
    with open('inserts_miembros.sql', 'w', encoding='utf-8') as archivo:
        archivo.write(contenido)

def llenar_usuarios():
    id = 1
    contenido = ''
    with open('miembros.txt', mode='r', newline='', encoding='utf-8') as archivo:
        # id, nombre, correo, contrasenia, miembro_id 
        for fila in archivo:
            fila = fila.strip().split('::')
            print(fila)
            codigo = fila[2]
            nombre = codigo
            correo = codigo + '@aloe.ulima.edu.pe'
            contrasenia = generar_contraseña()
            miembro_id = id
            tmp = f"INSERT INTO usuarios (id, nombre, correo, contrasenia, miembro_id) VALUES ({id}, '{nombre}', '{correo}', '{contrasenia}', {miembro_id});\n"
            contenido = contenido + tmp
            id = id + 1
    with open('inserts_usuarios.sql', 'w', encoding='utf-8') as archivo:
        archivo.write(contenido)

def llenar_rutinas():
    count = 0
    id = 1
    miembro_id = 1
    contenido = ''
    fecha_inicio = datetime(2022, 1, 1)
    fecha_fin = datetime(2023, 12, 31)
    while miembro_id <= 100:
        # rutina 1
        id = id + 1
        calentamiento = random.randint(1,4) * 5
        detalle = fake.text(max_nb_chars=120)
        fecha_aleatoria_inicio = fake.date_time_between(start_date=fecha_inicio, end_date=fecha_fin)
        inicio = fecha_aleatoria_inicio.strftime('%Y-%m-%d %H:%M:%S')
        fecha_aleatoria_fin = fecha_aleatoria_inicio + timedelta(days=random.randint(1,2) * 15)
        fin = fecha_aleatoria_fin.strftime('%Y-%m-%d %H:%M:%S')
        nivel_id = random.randint(1,20)
        objetivo_id = random.randint(1,10)
        tmp = f"INSERT INTO rutinas (id, calentamiento, detalle, inicio, fin, miembro_id, nivel_id, objetivo_id) VALUES ({id}, {calentamiento}, '{detalle}', '{str(inicio)}', '{str(fin)}', {miembro_id}, {nivel_id}, {objetivo_id});\n"
        contenido = contenido + tmp
        # resto de rutinas n
        n = random.randint(0, 20)
        k = 0
        count+=1
        #Asignamos varias rutinas a un mismo miembro
        while k < n:
            id = id + 1
            calentamiento = random.randint(1,4) * 5
            detalle = fake.text(max_nb_chars=120)
            #Se hace para ajustar el fin de una rutina con el inicio de la siguientes (de una misma persona)
            fecha_aleatoria_inicio = fecha_aleatoria_fin
            inicio = fecha_aleatoria_inicio.strftime('%Y-%m-%d %H:%M:%S')
            fecha_aleatoria_fin = fecha_aleatoria_inicio + timedelta(days=random.randint(1,2) * 15)
            fin = fecha_aleatoria_fin.strftime('%Y-%m-%d %H:%M:%S')
            nivel_id = random.randint(1,20)
            objetivo_id = random.randint(1,10)
            tmp = f"INSERT INTO rutinas (id, calentamiento, detalle, incio, fin, miembro_id, nivel_id, objetivo_id) VALUES ({id}, {calentamiento}, '{detalle}', '{str(inicio)}', '{str(fin)}', {miembro_id}, {nivel_id}, {objetivo_id});\n"
            contenido = contenido + tmp
            k = k + 1        
            count+=1
        miembro_id = miembro_id + 1       
    with open('inserts_rutinas.sql', 'w', encoding='utf-8') as archivo:
        archivo.write(contenido)
    
    print(count)

def llenar_rutinas_oracle():
    id = 1
    miembro_id = 1
    contenido = ''
    fecha_inicio = datetime(2022, 1, 1)
    fecha_fin = datetime(2023, 12, 31)
    while miembro_id <= 100:
        # rutina 1
        id = id + 1
        calentamiento = random.randint(1,4) * 5
        detalle = fake.text(max_nb_chars=120)
        fecha_aleatoria_inicio = fake.date_time_between(start_date=fecha_inicio, end_date=fecha_fin)
        inicio = fecha_aleatoria_inicio.strftime('%Y-%m-%d %H:%M:%S')
        fecha_aleatoria_fin = fecha_aleatoria_inicio + timedelta(days=random.randint(1,2) * 15)
        fin = fecha_aleatoria_fin.strftime('%Y-%m-%d %H:%M:%S')
        nivel_id = random.randint(1,20)
        objetivo_id = random.randint(1,10)
        tmp = f"INSERT INTO rutinas (id, calentamiento, detalle, inicio, fin, miembro_id, nivel_id, objetivo_id) VALUES ({id}, {calentamiento}, '{detalle}', TO_TIMESTAMP('{str(inicio)}', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('{str(fin)}', 'YYYY-MM-DD HH24:MI:SS'), {miembro_id}, {nivel_id}, {objetivo_id});\n"
        contenido = contenido + tmp
        # resto de rutinas n
        n = random.randint(0, 20)
        k = 0
        while k < n:
            id = id + 1
            calentamiento = random.randint(1,4) * 5
            detalle = fake.text(max_nb_chars=120)
            fecha_aleatoria_inicio = fecha_aleatoria_fin
            inicio = fecha_aleatoria_inicio.strftime('%Y-%m-%d %H:%M:%S')
            fecha_aleatoria_fin = fecha_aleatoria_inicio + timedelta(days=random.randint(1,2) * 15)
            fin = fecha_aleatoria_fin.strftime('%Y-%m-%d %H:%M:%S')
            nivel_id = random.randint(1,20)
            objetivo_id = random.randint(1,10)
            tmp = f"INSERT INTO rutinas (id, calentamiento, detalle, inicio, fin, miembro_id, nivel_id, objetivo_id) VALUES ({id}, {calentamiento}, '{detalle}', TO_TIMESTAMP('{str(inicio)}', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('{str(fin)}', 'YYYY-MM-DD HH24:MI:SS'), {miembro_id}, {nivel_id}, {objetivo_id});\n"
            contenido = contenido + tmp
            k = k + 1        
        miembro_id = miembro_id + 1       
    with open('inserts_rutinas_oracle.sql', 'w', encoding='utf-8') as archivo:
        archivo.write(contenido)

def llenar_ejercicios_rutinas():
    rutina_id = 1
    id = 1
    contenido = ''
    rutinas = 1114
    while rutina_id <= 1114:
        # generando ids de ejercicios aletaorios para cada rutina
        ejercicio_ids = []
        n = random.randint(15, 40)
        k = 0
        while k < n:
            ejercicio_id = random.randint(1,68)
            if ejercicio_id not in ejercicio_ids:
                ejercicio_ids.append(ejercicio_id)
                k = k + 1
        # generar el muchos ejercicios para una rutina
        orden = 0
        for ejercicio_id in ejercicio_ids:
            orden = orden + 1 
            series = random.randint(2,4)
            repeticiones = random.randint(2,4) * 5
            tmp = f"INSERT INTO ejercicios_rutinas (id, orden, series, repeticiones, ejercicio_id, rutina_id) VALUES ({id}, {orden}, {series}, {repeticiones}, {ejercicio_id}, {rutina_id});\n"
            contenido = contenido + tmp
            id = id + 1
        rutina_id = rutina_id + 1
    
    with open('inserts_llenar_ejercicios_rutinas.sql', 'w', encoding='utf-8') as archivo:
        archivo.write(contenido)

llenar_miembros()
llenar_usuarios()
llenar_rutinas()
llenar_ejercicios_rutinas()
llenar_rutinas_oracle()