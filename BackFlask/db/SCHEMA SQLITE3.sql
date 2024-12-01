CREATE TABLE etiquetas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE prioridades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(20) NOT NULL
);

CREATE TABLE documentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url_doc VARCHAR(200),
    tipo VARCHAR(30)
);
	
CREATE TABLE departamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE comentarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    contenido VARCHAR(200) NOT NULL,
    fecha DATETIME NOT NULL,
    id_analista INTEGER,
    id_developer INTEGER,
    FOREIGN KEY (id_analista) REFERENCES usuarios_analista(id),
    FOREIGN KEY (id_developer) REFERENCES usuarios_developer(id)
);

CREATE TABLE estados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL,
    url_imagen VARCHAR(200)
);

CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL,
    url_imagen VARCHAR(200),
    correo VARCHAR(100) NOT NULL,
    contrasenha VARCHAR(100) NOT NULL
);

CREATE TABLE usuarios_cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ruc VARCHAR(20) NOT NULL,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
    );
	
CREATE TABLE usuarios_analista (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE usuarios_developer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo VARCHAR(20) NOT NULL,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE proyectos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    id_cliente INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES usuarios_cliente(id)
);

CREATE TABLE incidencias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    resumen VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    fecha_envio DATETIME NOT NULL,
    fecha_actu DATETIME,
    id_proyecto INTEGER NOT NULL,
    id_departamento INTEGER ,
    id_estado INTEGER ,
    id_prioridad INTEGER ,
    id_documento INTEGER,
    FOREIGN KEY (id_proyecto) REFERENCES proyectos(id),
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id),
    FOREIGN KEY (id_estado) REFERENCES estados(id),
    FOREIGN KEY (id_prioridad) REFERENCES prioridades(id),
    FOREIGN KEY (id_documento) REFERENCES documentos(id)
);

CREATE TABLE etiquetas_incidencias(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_etiqueta INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_etiqueta) REFERENCES etiquetas(id)
);

CREATE TABLE developer_departamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_developer INTEGER NOT NULL,
    id_departamento INTEGER NOT NULL,
    FOREIGN KEY (id_developer) REFERENCES usuarios_developer(id),
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

CREATE TABLE documento_comentarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_documento INTEGER NOT NULL,
    id_comentario INTEGER NOT NULL,
    FOREIGN KEY (id_documento) REFERENCES documentos(id),  
    FOREIGN KEY (id_comentario) REFERENCES comentarios(id)
);

CREATE TABLE departamentos_proyecto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_departamento INTEGER NOT NULL,
    id_proyecto INTEGER NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id),
    FOREIGN KEY (id_proyecto) REFERENCES proyectos(id)
);

CREATE TABLE incidencia_cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_cliente) REFERENCES usuarios_cliente(id)
);

CREATE TABLE incidencia_analista(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_analista INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_analista) REFERENCES usuarios_analista(id)
);

CREATE TABLE incidencia_developer(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_developer INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_developer) REFERENCES usuarios_developer(id)
);

INSERT INTO etiquetas (id, nombre) VALUES (1, 'Urgente');
INSERT INTO etiquetas (id, nombre) VALUES (2, 'Bug');
INSERT INTO etiquetas (id, nombre) VALUES (3, 'Mejora');
INSERT INTO etiquetas (id, nombre) VALUES (4, 'Produccion');
INSERT INTO etiquetas (id, nombre) VALUES (5, 'Documentación');

INSERT INTO prioridades (id, nombre) VALUES (1, 'Alta');
INSERT INTO prioridades (id, nombre) VALUES (2, 'Media');
INSERT INTO prioridades (id, nombre) VALUES (3, 'Baja');
INSERT INTO prioridades (id, nombre) VALUES (4, 'Crítica');

INSERT INTO departamentos (id, nombre) VALUES (1, 'Recursos Humanos');
INSERT INTO departamentos (id, nombre) VALUES (2, 'Finanzas');
INSERT INTO departamentos (id, nombre) VALUES (3, 'Marketing');
INSERT INTO departamentos (id, nombre) VALUES (4, 'Tecnologia');
INSERT INTO departamentos (id, nombre) VALUES (5, 'Ventas');
INSERT INTO departamentos (id, nombre) VALUES (6, 'Operaciones');
INSERT INTO departamentos (id, nombre) VALUES (7, 'Logistica');
INSERT INTO departamentos (id, nombre) VALUES (8, 'Compras');
INSERT INTO departamentos (id, nombre) VALUES (9, 'Atencion al Cliente');
INSERT INTO departamentos (id, nombre) VALUES (10, 'Produccion');

-- migrate:up
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario1.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia2.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario3.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia4.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario5.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia6.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario7.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia8.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario9.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia10.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario11.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia12.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario13.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia14.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario15.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia16.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario17.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia18.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario19.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia20.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario21.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia22.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario23.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia24.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario25.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia26.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario27.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia28.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario29.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia30.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario31.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia32.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario33.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia34.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario35.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia36.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario37.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia38.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario39.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia40.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario41.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia42.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario43.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia44.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario45.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia46.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario47.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia48.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario49.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia50.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario51.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia52.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario53.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia54.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario55.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia56.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario57.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia58.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario59.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia60.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario61.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia62.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario63.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia64.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario65.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia66.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario67.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia68.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario69.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia70.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario71.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia72.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario73.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia74.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario75.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia76.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario77.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia78.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario79.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia80.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario81.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia82.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario83.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia84.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario85.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia86.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario87.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia88.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario89.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia90.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario91.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia92.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario93.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia94.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario95.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia96.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario97.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia98.pdf', 'incidencia');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/comentario99.pdf', 'comentario');
INSERT INTO documentos (url_doc, tipo) VALUES ('http://example.com/incidencia100.pdf', 'incidencia');

INSERT INTO estados (id, nombre, url_imagen) VALUES (1, 'Activo', 'https://example.com/activo.jpg');
INSERT INTO estados (id, nombre, url_imagen) VALUES (2, 'Inactivo', 'https://example.com/inactivo.jpg');
INSERT INTO estados (id, nombre, url_imagen) VALUES (3, 'Pendiente', 'https://example.com/pendiente.jpg');
INSERT INTO estados (id, nombre, url_imagen) VALUES (4, 'Finalizado', 'https://example.com/finalizado.jpg');


--migrate:up
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (1, 'Kailey', 'http://dummyimage.com/147x100.png/dddddd/000000', 'kautry0@telegraph.co.uk', 'P7mZ2gLx3aVq49F');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (2, 'Flossy', 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'fmcgowan1@kickstarter.com', 'XmL72Qd8nTYp36K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (3, 'Penelopa', 'http://dummyimage.com/134x100.png/dddddd/000000', 'pcrayker2@youtu.be', 'Zp4nXw37MvL82gJ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (4, 'Harrison', 'http://dummyimage.com/217x100.png/cc0000/ffffff', 'hdawdry3@weather.com', 'T5vR8KqL32Xm9Nz');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (5, 'Jessi', 'http://dummyimage.com/206x100.png/5fa2dd/ffffff', 'jcroux4@npr.org', 'V3mYnKZ84XpTq65');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (6, 'Melloney', 'http://dummyimage.com/239x100.png/dddddd/000000', 'mdunsire5@tamu.edu', 'Lw92XMpT4Kv37nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (7, 'Nikki', 'http://dummyimage.com/135x100.png/5fa2dd/ffffff', 'njorez6@prweb.com', 'KqZ48YmT5Xp36Ln');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (8, 'Renell', 'http://dummyimage.com/202x100.png/dddddd/000000', 'rtenman7@g.co', 'Xp37VnTq49L2KmZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (9, 'Matthus', 'http://dummyimage.com/177x100.png/5fa2dd/ffffff', 'mbentley8@amazon.de', 'ZnL8KqX5V3m72Tp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (10, 'Jenny', 'http://dummyimage.com/218x100.png/cc0000/ffffff', 'jbaillie9@upenn.edu', 'L2mXqK95T37p8nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (11, 'Bay', 'http://dummyimage.com/232x100.png/dddddd/000000', 'broseborougha@noaa.gov', 'Tp82L3Vn4XmZ5Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (12, 'Cchaddie', 'http://dummyimage.com/121x100.png/ff4444/ffffff', 'cnewcomeb@hugedomains.com', 'n9KZ3XmL45p72Vq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (13, 'Renelle', 'http://dummyimage.com/121x100.png/ff4444/ffffff', 'rjermeyc@constantcontact.com', 'K5V7nT82L4qXmZ3');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (14, 'Amity', 'http://dummyimage.com/218x100.png/dddddd/000000', 'ajunkisond@bluehost.com', 'XpT9m3V2KZ4nL85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (15, 'Janetta', 'http://dummyimage.com/204x100.png/dddddd/000000', 'jfilmere@bloglines.com', 'TpXm37Z9L82V5nq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (16, 'Tasia', 'http://dummyimage.com/181x100.png/5fa2dd/ffffff', 'tscottingf@qq.com', 'ZnT5mL2Xp37V8Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (17, 'Nickie', 'http://dummyimage.com/162x100.png/ff4444/ffffff', 'ntownsg@zdnet.com', 'L3n5VZq9K2m7XpT');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (18, 'Bernie', 'http://dummyimage.com/159x100.png/ff4444/ffffff', 'bidellh@livejournal.com', 'qXm82V5nT9m4Z3L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (19, 'Leslie', 'http://dummyimage.com/156x100.png/ff4444/ffffff', 'lgummeryi@fda.gov', 'VZ2m9XpT7L8n3Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (20, 'Kippie', 'http://dummyimage.com/216x100.png/dddddd/000000', 'kdenverj@sphinn.com', 'L9VXpT2n5Z8K37m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (21, 'Kathryne', 'http://dummyimage.com/223x100.png/dddddd/000000', 'kkilgrovek@sitemeter.com', 'XpT7qZL5Vn9m38K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (22, 'Ingar', 'http://dummyimage.com/250x100.png/5fa2dd/ffffff', 'icastiglionil@plala.or.jp', 'Zn3V7KqT8L2Xp5m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (23, 'Taber', 'http://dummyimage.com/131x100.png/ff4444/ffffff', 'tdutteridgem@china.com.cn', 'Kq9mT5L37Zn82Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (24, 'Merry', 'http://dummyimage.com/215x100.png/5fa2dd/ffffff', 'miresonn@stanford.edu', 'T5m9L3VZ82Kq7nXp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (25, 'Annelise', 'http://dummyimage.com/158x100.png/5fa2dd/ffffff', 'amcaleeseo@intel.com', 'nXpVZ5qL2K7T3m8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (26, 'Theda', 'http://dummyimage.com/164x100.png/ff4444/ffffff', 'tashbep@cnet.com', 'q9m3nXp7VZ5KL8T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (27, 'Deanna', 'http://dummyimage.com/159x100.png/ff4444/ffffff', 'ddunstanq@jiathis.com', 'm7nXp9T5V2ZKL3q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (28, 'Deedee', 'http://dummyimage.com/157x100.png/dddddd/000000', 'dhaggithr@example.com', 'Vq9mX7L5T3Zn82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (29, 'Dallon', 'http://dummyimage.com/246x100.png/5fa2dd/ffffff', 'dwishers@quantcast.com', 'qT8nL3Xm9VZ5K7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (30, 'Westbrook', 'http://dummyimage.com/188x100.png/ff4444/ffffff', 'wmoreingt@statcounter.com', 'Xm7T9nL5qV2ZK3m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (31, 'Nathanial', 'http://dummyimage.com/148x100.png/5fa2dd/ffffff', 'nrapelliu@mashable.com', 'VZnq5T3L9mK7Xp8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (32, 'Deni', 'http://dummyimage.com/227x100.png/5fa2dd/ffffff', 'dlapadulav@springer.com', 'q9L3VZ5KXm7T82n');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (33, 'Meg', 'http://dummyimage.com/128x100.png/dddddd/000000', 'mdownsew@usa.gov', 'VXmL3nZ5q8K9T7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (34, 'Blair', 'http://dummyimage.com/133x100.png/ff4444/ffffff', 'bbartusekx@desdev.cn', 'mL7nT9Kq5V82Z3Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (35, 'Janis', 'http://dummyimage.com/223x100.png/cc0000/ffffff', 'jjillitty@ameblo.jp', 'VZ5K7TnLm93Xp82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (36, 'Hervey', 'http://dummyimage.com/141x100.png/5fa2dd/ffffff', 'hpensonz@china.com.cn', 'TpXmL3n7KqV9Z85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (37, 'Gilburt', 'http://dummyimage.com/175x100.png/ff4444/ffffff', 'gtournie10@pagesperso-orange.fr', 'Xp9L3T7nZKq5mV82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (38, 'Orelee', 'http://dummyimage.com/162x100.png/dddddd/000000', 'olocksley11@gravatar.com', 'VXmZ5K9n3T7Lm82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (39, 'Elena', 'http://dummyimage.com/129x100.png/cc0000/ffffff', 'elepine12@ucoz.ru', 'TpXm7KZL5V9n3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (40, 'Gavan', 'http://dummyimage.com/116x100.png/cc0000/ffffff', 'gbroe13@mapy.cz', 'Xp9nL7m3KqZ5T82V');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (41, 'Amber', 'http://dummyimage.com/144x100.png/ff4444/ffffff', 'asinnett14@wired.com', 'Xm9qT5VZ3nK7Lp82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (42, 'Eddie', 'http://dummyimage.com/150x100.png/5fa2dd/ffffff', 'epetrolli15@alibaba.com', 'KqXmT3nVZ9mL5p72');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (43, 'Tobit', 'http://dummyimage.com/151x100.png/ff4444/ffffff', 'twaters16@about.me', 'mVnL2qT5K9Z7Xp83');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (44, 'Lennie', 'http://dummyimage.com/207x100.png/ff4444/ffffff', 'lcherryman17@seattletimes.com', 'qT9K7nXpZ5Lm3V82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (45, 'Monro', 'http://dummyimage.com/230x100.png/cc0000/ffffff', 'mbradfield18@feedburner.com', 'Z5Lm9TqKXp3Vn7m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (46, 'Nani', 'http://dummyimage.com/206x100.png/cc0000/ffffff', 'npolfer19@sohu.com', 'nXp3VZ5L7q9mK82T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (47, 'Claudine', 'http://dummyimage.com/133x100.png/5fa2dd/ffffff', 'cbarks1a@house.gov', 'T9mV5Lq7KXpZ3n82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (48, 'Ellwood', 'http://dummyimage.com/142x100.png/5fa2dd/ffffff', 'evasilmanov1b@fema.gov', 'L9T7KXmVq5nZ3m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (49, 'Prentice', 'http://dummyimage.com/166x100.png/cc0000/ffffff', 'plonghorn1c@issuu.com', 'nXm7L3T9Vq5ZK82m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (50, 'Tobye', 'http://dummyimage.com/173x100.png/5fa2dd/ffffff', 'tamanger1d@trellian.com', 'm5n7qZ9T3VXpK82L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (51, 'Tito', 'http://dummyimage.com/238x100.png/5fa2dd/ffffff', 'tdecoursey1e@usda.gov', 'qZ7nXmL9m3T5V82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (52, 'Solomon', 'http://dummyimage.com/136x100.png/dddddd/000000', 'sedis1f@de.vu', 'KZL9V5Tn7mXp3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (53, 'Tess', 'http://dummyimage.com/106x100.png/dddddd/000000', 'trist1g@shinystat.com', 'm3T5ZK9n7Lp82VqX');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (54, 'Vittorio', 'http://dummyimage.com/246x100.png/5fa2dd/ffffff', 'vbrian1h@nps.gov', 'Vn7qL9mXpKZ5T3m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (55, 'Manny', 'http://dummyimage.com/226x100.png/dddddd/000000', 'mflude1i@wikia.com', 'P7mZ2gLx3aVq49F');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (56, 'Bastian', 'http://dummyimage.com/217x100.png/ff4444/ffffff', 'bbrandi1j@cmu.edu', 'XmL72Qd8nTYp36K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (57, 'Valentia', 'http://dummyimage.com/222x100.png/ff4444/ffffff', 'vrougier1k@ning.com', 'Zp4nXw37MvL82gJ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (58, 'Rickey', 'http://dummyimage.com/209x100.png/cc0000/ffffff', 'rhulland1l@ucsd.edu', 'T5vR8KqL32Xm9Nz');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (59, 'Rafa', 'http://dummyimage.com/183x100.png/dddddd/000000', 'rmacmurray1m@timesonline.co.uk', 'V3mYnKZ84XpTq65');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (60, 'Michale', 'http://dummyimage.com/159x100.png/dddddd/000000', 'mcapozzi1n@arizona.edu', 'Lw92XMpT4Kv37nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (61, 'Yevette', 'http://dummyimage.com/228x100.png/dddddd/000000', 'ytomkys1o@ucoz.com', 'KqZ48YmT5Xp36Ln');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (62, 'Vere', 'http://dummyimage.com/209x100.png/cc0000/ffffff', 'vertel1p@techcrunch.com', 'Xp37VnTq49L2KmZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (63, 'Mamie', 'http://dummyimage.com/216x100.png/ff4444/ffffff', 'mmadre1q@behance.net', 'ZnL8KqX5V3m72Tp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (64, 'Lindy', 'http://dummyimage.com/250x100.png/cc0000/ffffff', 'lblizard1r@google.it', 'L2mXqK95T37p8nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (65, 'Floyd', 'http://dummyimage.com/169x100.png/dddddd/000000', 'fswatland1s@pagesperso-orange.fr', 'Tp82L3Vn4XmZ5Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (66, 'Domini', 'http://dummyimage.com/104x100.png/ff4444/ffffff', 'dwaterstone1t@indiegogo.com', 'n9KZ3XmL45p72Vq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (67, 'Dani', 'http://dummyimage.com/245x100.png/cc0000/ffffff', 'dbraxay1u@nyu.edu', 'K5V7nT82L4qXmZ3');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (68, 'Zeb', 'http://dummyimage.com/179x100.png/ff4444/ffffff', 'znelligan1v@wix.com', 'XpT9m3V2KZ4nL85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (69, 'Boone', 'http://dummyimage.com/148x100.png/cc0000/ffffff', 'bpolson1w@acquirethisname.com', 'TpXm37Z9L82V5nq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (70, 'Nadia', 'http://dummyimage.com/225x100.png/cc0000/ffffff', 'ncuffe1x@t-online.de', 'ZnT5mL2Xp37V8Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (71, 'Christyna', 'http://dummyimage.com/189x100.png/cc0000/ffffff', 'cmcgiffin1y@odnoklassniki.ru', 'L3n5VZq9K2m7XpT');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (72, 'Cross', 'http://dummyimage.com/119x100.png/cc0000/ffffff', 'cgonzalvo1z@cpanel.net', 'qXm82V5nT9m4Z3L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (73, 'Constantine', 'http://dummyimage.com/156x100.png/ff4444/ffffff', 'csidery20@wp.com', 'VZ2m9XpT7L8n3Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (74, 'Virgil', 'http://dummyimage.com/151x100.png/cc0000/ffffff', 'viskov21@dailymotion.com', 'L9VXpT2n5Z8K37m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (75, 'Elissa', 'http://dummyimage.com/250x100.png/5fa2dd/ffffff', 'ereally22@bloomberg.com', 'XpT7qZL5Vn9m38K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (76, 'Audrie', 'http://dummyimage.com/202x100.png/ff4444/ffffff', 'ameckiff23@webeden.co.uk', 'Zn3V7KqT8L2Xp5m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (77, 'Johnna', 'http://dummyimage.com/182x100.png/5fa2dd/ffffff', 'jluxen24@e-recht24.de', 'Kq9mT5L37Zn82Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (78, 'Nadiya', 'http://dummyimage.com/203x100.png/5fa2dd/ffffff', 'ntringham25@prlog.org', 'T5m9L3VZ82Kq7nXp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (79, 'Hewet', 'http://dummyimage.com/209x100.png/ff4444/ffffff', 'hperico26@plala.or.jp', 'nXpVZ5qL2K7T3m8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (80, 'Fan', 'http://dummyimage.com/161x100.png/cc0000/ffffff', 'fpattison27@nature.com', 'q9m3nXp7VZ5KL8T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (81, 'Yance', 'http://dummyimage.com/153x100.png/dddddd/000000', 'ycalvert28@earthlink.net', 'm7nXp9T5V2ZKL3q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (82, 'Lynnea', 'http://dummyimage.com/108x100.png/cc0000/ffffff', 'lchasmor29@accuweather.com', 'Vq9mX7L5T3Zn82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (83, 'Waylon', 'http://dummyimage.com/120x100.png/cc0000/ffffff', 'wberetta2a@nbcnews.com', 'qT8nL3Xm9VZ5K7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (84, 'Lem', 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', 'lhobbert2b@sogou.com', 'Xm7T9nL5qV2ZK3m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (85, 'Cally', 'http://dummyimage.com/129x100.png/dddddd/000000', 'csegoe2c@miibeian.gov.cn', 'VZnq5T3L9mK7Xp8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (86, 'Ciro', 'http://dummyimage.com/249x100.png/dddddd/000000', 'cbagguley2d@posterous.com', 'q9L3VZ5KXm7T82n');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (87, 'Noella', 'http://dummyimage.com/177x100.png/cc0000/ffffff', 'ntarbath2e@google.fr', 'VXmL3nZ5q8K9T7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (88, 'Letisha', 'http://dummyimage.com/175x100.png/5fa2dd/ffffff', 'lmacgillicuddy2f@accuweather.com', 'mL7nT9Kq5V82Z3Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (89, 'Abraham', 'http://dummyimage.com/194x100.png/dddddd/000000', 'aaveline2g@typepad.com', 'VZ5K7TnLm93Xp82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (90, 'Timmie', 'http://dummyimage.com/212x100.png/5fa2dd/ffffff', 'tmurrum2h@ox.ac.uk', 'TpXmL3n7KqV9Z85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (91, 'Cosetta', 'http://dummyimage.com/196x100.png/dddddd/000000', 'cattenburrow2i@cargocollective.com', 'Xp9L3T7nZKq5mV82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (92, 'Cy', 'http://dummyimage.com/133x100.png/cc0000/ffffff', 'ckilgannon2j@issuu.com', 'VXmZ5K9n3T7Lm82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (93, 'Emalee', 'http://dummyimage.com/216x100.png/5fa2dd/ffffff', 'ebrahms2k@parallels.com', 'TpXm7KZL5V9n3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (94, 'Trudy', 'http://dummyimage.com/236x100.png/dddddd/000000', 'tvreiberg2l@china.com.cn', 'Xp9nL7m3KqZ5T82V');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (95, 'Ingaborg', 'http://dummyimage.com/173x100.png/5fa2dd/ffffff', 'ifallow2m@example.com', 'Xm9qT5VZ3nK7Lp82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (96, 'Mel', 'http://dummyimage.com/130x100.png/ff4444/ffffff', 'maubert2n@technorati.com', 'KqXmT3nVZ9mL5p72');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (97, 'Dania', 'http://dummyimage.com/199x100.png/ff4444/ffffff', 'dhesser2o@purevolume.com', 'mVnL2qT5K9Z7Xp83');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (98, 'Ashli', 'http://dummyimage.com/245x100.png/dddddd/000000', 'atubble2p@un.org', 'qT9K7nXpZ5Lm3V82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (99, 'Evin', 'http://dummyimage.com/249x100.png/dddddd/000000', 'eleathes2q@google.ca', 'Z5Lm9TqKXp3Vn7m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (100, 'Kippar', 'http://dummyimage.com/240x100.png/ff4444/ffffff', 'karmitt2r@networksolutions.com', 'nXp3VZ5L7q9mK82T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (101, 'Tallulah', 'http://dummyimage.com/213x100.png/cc0000/ffffff', 'twoollam2s@theatlantic.com', 'T9mV5Lq7KXpZ3n82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (102, 'Karyn', 'http://dummyimage.com/151x100.png/ff4444/ffffff', 'kdoogan2t@indiatimes.com', 'L9T7KXmVq5nZ3m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (103, 'Jessalyn', 'http://dummyimage.com/240x100.png/cc0000/ffffff', 'jaime2u@google.com.au', 'nXm7L3T9Vq5ZK82m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (104, 'Cody', 'http://dummyimage.com/172x100.png/dddddd/000000', 'ccarr2v@goodreads.com', 'm5n7qZ9T3VXpK82L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (105, 'Susannah', 'http://dummyimage.com/206x100.png/5fa2dd/ffffff', 'sbrasseur2w@e-recht24.de', 'qZ7nXmL9m3T5V82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (106, 'Dinnie', 'http://dummyimage.com/249x100.png/ff4444/ffffff', 'dmaffia2x@redcross.org', 'KZL9V5Tn7mXp3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (107, 'Andie', 'http://dummyimage.com/165x100.png/5fa2dd/ffffff', 'acotty2y@eepurl.com', 'm3T5ZK9n7Lp82VqX');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (108, 'Merrielle', 'http://dummyimage.com/140x100.png/ff4444/ffffff', 'moxburgh2z@addtoany.com', 'P7mZ2gLx3aVq49F');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (109, 'Marietta', 'http://dummyimage.com/215x100.png/dddddd/000000', 'mpaulat30@angelfire.com', 'XmL72Qd8nTYp36K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (110, 'Chaddy', 'http://dummyimage.com/249x100.png/5fa2dd/ffffff', 'cdunnet31@sun.com', 'Zp4nXw37MvL82gJ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (111, 'Lidia', 'http://dummyimage.com/195x100.png/dddddd/000000', 'lprettyjohn32@wired.com', 'T5vR8KqL32Xm9Nz');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (112, 'Ginger', 'http://dummyimage.com/205x100.png/dddddd/000000', 'gocodihie33@zdnet.com', 'V3mYnKZ84XpTq65');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (113, 'Mariette', 'http://dummyimage.com/163x100.png/dddddd/000000', 'mbotte34@phoca.cz', 'Lw92XMpT4Kv37nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (114, 'Freddie', 'http://dummyimage.com/116x100.png/ff4444/ffffff', 'fkruszelnicki35@w3.org', 'KqZ48YmT5Xp36Ln');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (115, 'Crissy', 'http://dummyimage.com/223x100.png/ff4444/ffffff', 'csked36@gnu.org', 'Xp37VnTq49L2KmZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (116, 'Emmery', 'http://dummyimage.com/191x100.png/ff4444/ffffff', 'esimionato37@aol.com', 'ZnL8KqX5V3m72Tp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (117, 'Cordula', 'http://dummyimage.com/168x100.png/ff4444/ffffff', 'cpollitt38@uol.com.br', 'L2mXqK95T37p8nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (118, 'Akim', 'http://dummyimage.com/120x100.png/5fa2dd/ffffff', 'agrube39@google.co.uk', 'Tp82L3Vn4XmZ5Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (119, 'Tracy', 'http://dummyimage.com/147x100.png/cc0000/ffffff', 'tvigors3a@posterous.com', 'n9KZ3XmL45p72Vq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (120, 'Niel', 'http://dummyimage.com/247x100.png/ff4444/ffffff', 'nkinchley3b@cpanel.net', 'K5V7nT82L4qXmZ3');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (121, 'Caril', 'http://dummyimage.com/214x100.png/ff4444/ffffff', 'cagglione3c@wsj.com', 'XpT9m3V2KZ4nL85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (122, 'Deane', 'http://dummyimage.com/155x100.png/ff4444/ffffff', 'dcheeney3d@bloomberg.com', 'TpXm37Z9L82V5nq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (123, 'Noel', 'http://dummyimage.com/219x100.png/ff4444/ffffff', 'npaullin3e@bbb.org', 'ZnT5mL2Xp37V8Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (124, 'Lexis', 'http://dummyimage.com/138x100.png/dddddd/000000', 'lmerchant3f@dmoz.org', 'L3n5VZq9K2m7XpT');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (125, 'Alethea', 'http://dummyimage.com/213x100.png/cc0000/ffffff', 'awickliffe3g@rambler.ru', 'qXm82V5nT9m4Z3L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (126, 'Ulrick', 'http://dummyimage.com/164x100.png/5fa2dd/ffffff', 'uyurevich3h@nasa.gov', 'VZ2m9XpT7L8n3Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (127, 'Franky', 'http://dummyimage.com/232x100.png/dddddd/000000', 'fwinspear3i@cnn.com', 'L9VXpT2n5Z8K37m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (128, 'Arne', 'http://dummyimage.com/133x100.png/dddddd/000000', 'alortzing3j@digg.com', 'XpT7qZL5Vn9m38K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (129, 'Cherri', 'http://dummyimage.com/108x100.png/cc0000/ffffff', 'cpetzold3k@hp.com', 'Zn3V7KqT8L2Xp5m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (130, 'Jonah', 'http://dummyimage.com/200x100.png/5fa2dd/ffffff', 'jgorrissen3l@is.gd', 'Kq9mT5L37Zn82Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (131, 'Jenn', 'http://dummyimage.com/234x100.png/dddddd/000000', 'jblaszkiewicz3m@abc.net.au', 'T5m9L3VZ82Kq7nXp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (132, 'Beverly', 'http://dummyimage.com/158x100.png/dddddd/000000', 'bshovelton3n@baidu.com', 'nXpVZ5qL2K7T3m8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (133, 'Quinlan', 'http://dummyimage.com/170x100.png/cc0000/ffffff', 'qgrangier3o@cloudflare.com', 'q9m3nXp7VZ5KL8T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (134, 'Lamont', 'http://dummyimage.com/249x100.png/cc0000/ffffff', 'labisetti3p@uiuc.edu', 'm7nXp9T5V2ZKL3q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (135, 'Irv', 'http://dummyimage.com/131x100.png/cc0000/ffffff', 'iklimt3q@istockphoto.com', 'Vq9mX7L5T3Zn82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (136, 'Rawley', 'http://dummyimage.com/189x100.png/ff4444/ffffff', 'rspellissy3r@sitemeter.com', 'qT8nL3Xm9VZ5K7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (137, 'Charlena', 'http://dummyimage.com/191x100.png/5fa2dd/ffffff', 'clerego3s@sfgate.com', 'Xm7T9nL5qV2ZK3m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (138, 'Jayme', 'http://dummyimage.com/186x100.png/5fa2dd/ffffff', 'jvassar3t@dedecms.com', 'VZnq5T3L9mK7Xp8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (139, 'Brion', 'http://dummyimage.com/177x100.png/cc0000/ffffff', 'bdeverick3u@blogtalkradio.com', 'q9L3VZ5KXm7T82n');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (140, 'Katleen', 'http://dummyimage.com/152x100.png/5fa2dd/ffffff', 'kdytham3v@virginia.edu', 'VXmL3nZ5q8K9T7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (141, 'Orren', 'http://dummyimage.com/185x100.png/5fa2dd/ffffff', 'oceely3w@toplist.cz', 'mL7nT9Kq5V82Z3Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (142, 'Anjanette', 'http://dummyimage.com/120x100.png/dddddd/000000', 'atrangmar3x@merriam-webster.com', 'VZ5K7TnLm93Xp82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (143, 'Leoine', 'http://dummyimage.com/196x100.png/ff4444/ffffff', 'lkmietsch3y@webs.com', 'TpXmL3n7KqV9Z85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (144, 'Dean', 'http://dummyimage.com/224x100.png/ff4444/ffffff', 'dgors3z@myspace.com', 'Xp9L3T7nZKq5mV82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (145, 'Mariana', 'http://dummyimage.com/104x100.png/5fa2dd/ffffff', 'mnottingam40@bing.com', 'VXmZ5K9n3T7Lm82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (146, 'Batsheva', 'http://dummyimage.com/244x100.png/5fa2dd/ffffff', 'bcritchell41@weather.com', 'TpXm7KZL5V9n3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (147, 'Jordain', 'http://dummyimage.com/197x100.png/ff4444/ffffff', 'jgerraty42@shutterfly.com', 'Xp9nL7m3KqZ5T82V');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (148, 'Byrann', 'http://dummyimage.com/134x100.png/cc0000/ffffff', 'bconyers43@stumbleupon.com', 'Xm9qT5VZ3nK7Lp82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (149, 'Avril', 'http://dummyimage.com/246x100.png/dddddd/000000', 'aironside44@1688.com', 'KqXmT3nVZ9mL5p72');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (150, 'Bonnie', 'http://dummyimage.com/248x100.png/cc0000/ffffff', 'blamport45@youku.com', 'mVnL2qT5K9Z7Xp83');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (151, 'Kristel', 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'kkrzysztof46@zdnet.com', 'qT9K7nXpZ5Lm3V82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (152, 'Jeremiah', 'http://dummyimage.com/102x100.png/5fa2dd/ffffff', 'jsimmonds47@hugedomains.com', 'Z5Lm9TqKXp3Vn7m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (153, 'Shelley', 'http://dummyimage.com/220x100.png/ff4444/ffffff', 'spoolman48@google.ca', 'nXp3VZ5L7q9mK82T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (154, 'Cacilia', 'http://dummyimage.com/244x100.png/5fa2dd/ffffff', 'causello49@deviantart.com', 'T9mV5Lq7KXpZ3n82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (155, 'Ronica', 'http://dummyimage.com/122x100.png/dddddd/000000', 'rruseworth4a@gnu.org', 'L9T7KXmVq5nZ3m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (156, 'Marina', 'http://dummyimage.com/190x100.png/5fa2dd/ffffff', 'mfattorini4b@mac.com', 'nXm7L3T9Vq5ZK82m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (157, 'Ewell', 'http://dummyimage.com/175x100.png/dddddd/000000', 'elebang4c@fastcompany.com', 'm5n7qZ9T3VXpK82L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (158, 'Suki', 'http://dummyimage.com/206x100.png/5fa2dd/ffffff', 'srollitt4d@free.fr', 'qZ7nXmL9m3T5V82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (159, 'Sybil', 'http://dummyimage.com/240x100.png/cc0000/ffffff', 'sangric4e@yellowpages.com', 'KZL9V5Tn7mXp3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (160, 'Hamlin', 'http://dummyimage.com/180x100.png/dddddd/000000', 'hmarquez4f@theglobeandmail.com', 'P7mZ2gLx3aVq49F');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (161, 'Corinna', 'http://dummyimage.com/215x100.png/cc0000/ffffff', 'cburnyate4g@google.com', 'XmL72Qd8nTYp36K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (162, 'Bucky', 'http://dummyimage.com/141x100.png/cc0000/ffffff', 'btorns4h@yahoo.co.jp', 'Zp4nXw37MvL82gJ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (163, 'Annalee', 'http://dummyimage.com/195x100.png/cc0000/ffffff', 'agoman4i@wikispaces.com', 'T5vR8KqL32Xm9Nz');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (164, 'Julienne', 'http://dummyimage.com/175x100.png/cc0000/ffffff', 'jtwitchings4j@sogou.com', 'V3mYnKZ84XpTq65');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (165, 'Kathrine', 'http://dummyimage.com/191x100.png/dddddd/000000', 'ktilley4k@surveymonkey.com', 'Lw92XMpT4Kv37nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (166, 'Natala', 'http://dummyimage.com/241x100.png/ff4444/ffffff', 'nimort4l@nhs.uk', 'KqZ48YmT5Xp36Ln');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (167, 'Elaine', 'http://dummyimage.com/145x100.png/5fa2dd/ffffff', 'egrima4m@dailymotion.com', 'Xp37VnTq49L2KmZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (168, 'Leeann', 'http://dummyimage.com/130x100.png/5fa2dd/ffffff', 'lgreenfield4n@godaddy.com', 'ZnL8KqX5V3m72Tp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (169, 'Willetta', 'http://dummyimage.com/141x100.png/dddddd/000000', 'wbrik4o@flavors.me', 'L2mXqK95T37p8nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (170, 'Blondell', 'http://dummyimage.com/245x100.png/ff4444/ffffff', 'bminshaw4p@seattletimes.com', 'Tp82L3Vn4XmZ5Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (171, 'Pet', 'http://dummyimage.com/153x100.png/ff4444/ffffff', 'pbigrigg4q@jimdo.com', 'n9KZ3XmL45p72Vq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (172, 'Marlee', 'http://dummyimage.com/140x100.png/5fa2dd/ffffff', 'mkingdon4r@blogs.com', 'K5V7nT82L4qXmZ3');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (173, 'Wilbert', 'http://dummyimage.com/118x100.png/ff4444/ffffff', 'wcoller4s@prnewswire.com', 'XpT9m3V2KZ4nL85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (174, 'Darsie', 'http://dummyimage.com/245x100.png/5fa2dd/ffffff', 'dbursnell4t@chronoengine.com', 'TpXm37Z9L82V5nq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (175, 'Ignacio', 'http://dummyimage.com/179x100.png/cc0000/ffffff', 'iiacomettii4u@nature.com', 'ZnT5mL2Xp37V8Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (176, 'Valida', 'http://dummyimage.com/115x100.png/dddddd/000000', 'vsushams4v@gov.uk', 'L3n5VZq9K2m7XpT');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (177, 'Seth', 'http://dummyimage.com/131x100.png/ff4444/ffffff', 'sgammett4w@washingtonpost.com', 'qXm82V5nT9m4Z3L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (178, 'Godiva', 'http://dummyimage.com/157x100.png/5fa2dd/ffffff', 'gpetrollo4x@nasa.gov', 'VZ2m9XpT7L8n3Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (179, 'Thurston', 'http://dummyimage.com/173x100.png/cc0000/ffffff', 'thumbey4y@youtube.com', 'L9VXpT2n5Z8K37m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (180, 'Gan', 'http://dummyimage.com/240x100.png/cc0000/ffffff', 'gmacilory4z@about.me', 'XpT7qZL5Vn9m38K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (181, 'Marcela', 'http://dummyimage.com/247x100.png/dddddd/000000', 'mbarnewille50@livejournal.com', 'Zn3V7KqT8L2Xp5m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (182, 'Madge', 'http://dummyimage.com/237x100.png/dddddd/000000', 'mhumpatch51@pcworld.com', 'Kq9mT5L37Zn82Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (183, 'Gonzalo', 'http://dummyimage.com/181x100.png/5fa2dd/ffffff', 'gburrel52@chronoengine.com', 'T5m9L3VZ82Kq7nXp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (184, 'Ailey', 'http://dummyimage.com/157x100.png/cc0000/ffffff', 'aleddie53@amazon.co.uk', 'nXpVZ5qL2K7T3m8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (185, 'Hermia', 'http://dummyimage.com/127x100.png/cc0000/ffffff', 'hmeckiff54@wp.com', 'q9m3nXp7VZ5KL8T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (186, 'Julita', 'http://dummyimage.com/245x100.png/5fa2dd/ffffff', 'jcoronado55@clickbank.net', 'm7nXp9T5V2ZKL3q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (187, 'Christophe', 'http://dummyimage.com/190x100.png/ff4444/ffffff', 'cmorsom56@un.org', 'Vq9mX7L5T3Zn82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (188, 'Danielle', 'http://dummyimage.com/219x100.png/cc0000/ffffff', 'dshoosmith57@w3.org', 'qT8nL3Xm9VZ5K7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (189, 'Violette', 'http://dummyimage.com/147x100.png/5fa2dd/ffffff', 'vcarnalan58@who.int', 'Xm7T9nL5qV2ZK3m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (190, 'Nikita', 'http://dummyimage.com/197x100.png/5fa2dd/ffffff', 'nlindenboim59@nba.com', 'VZnq5T3L9mK7Xp8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (191, 'Hartwell', 'http://dummyimage.com/247x100.png/cc0000/ffffff', 'hceccoli5a@goodreads.com', 'q9L3VZ5KXm7T82n');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (192, 'Etti', 'http://dummyimage.com/107x100.png/ff4444/ffffff', 'etingly5b@theguardian.com', 'VXmL3nZ5q8K9T7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (193, 'Sybilla', 'http://dummyimage.com/249x100.png/dddddd/000000', 'smeharry5c@slideshare.net', 'mL7nT9Kq5V82Z3Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (194, 'Merralee', 'http://dummyimage.com/145x100.png/dddddd/000000', 'mrumbellow5d@mayoclinic.com', 'VZ5K7TnLm93Xp82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (195, 'Delinda', 'http://dummyimage.com/106x100.png/cc0000/ffffff', 'dbroomfield5e@tuttocitta.it', 'TpXmL3n7KqV9Z85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (196, 'Miles', 'http://dummyimage.com/217x100.png/ff4444/ffffff', 'mpoyzer5f@japanpost.jp', 'Xp9L3T7nZKq5mV82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (197, 'Freeland', 'http://dummyimage.com/160x100.png/dddddd/000000', 'fberi5g@gravatar.com', 'VXmZ5K9n3T7Lm82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (198, 'Lynda', 'http://dummyimage.com/132x100.png/cc0000/ffffff', 'lmerali5h@umich.edu', 'TpXm7KZL5V9n3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (199, 'Alva', 'http://dummyimage.com/103x100.png/ff4444/ffffff', 'acongreave5i@woothemes.com', 'Xp9nL7m3KqZ5T82V');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (200, 'Laurice', 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', 'lobispo5j@ocn.ne.jp', 'Xm9qT5VZ3nK7Lp82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (201, 'Tibold', 'http://dummyimage.com/224x100.png/cc0000/ffffff', 'tdamato5k@whitehouse.gov', 'KqXmT3nVZ9mL5p72');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (202, 'Marla', 'http://dummyimage.com/158x100.png/dddddd/000000', 'mzebedee5l@istockphoto.com', 'mVnL2qT5K9Z7Xp83');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (203, 'Garnette', 'http://dummyimage.com/173x100.png/dddddd/000000', 'gnorway5m@fc2.com', 'qT9K7nXpZ5Lm3V82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (204, 'Claudio', 'http://dummyimage.com/204x100.png/dddddd/000000', 'cfearnall5n@bloglovin.com', 'Z5Lm9TqKXp3Vn7m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (205, 'Rorke', 'http://dummyimage.com/183x100.png/dddddd/000000', 'rdevoiels5o@yolasite.com', 'nXp3VZ5L7q9mK82T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (206, 'Karmen', 'http://dummyimage.com/247x100.png/dddddd/000000', 'ksimmers5p@cnet.com', 'T9mV5Lq7KXpZ3n82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (207, 'Neala', 'http://dummyimage.com/178x100.png/dddddd/000000', 'nslowley5q@sciencedaily.com', 'L9T7KXmVq5nZ3m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (208, 'Bucky', 'http://dummyimage.com/152x100.png/cc0000/ffffff', 'bpecht5r@mlb.com', 'nXm7L3T9Vq5ZK82m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (209, 'Ingelbert', 'http://dummyimage.com/148x100.png/cc0000/ffffff', 'iberndt5s@mit.edu', 'm5n7qZ9T3VXpK82L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (210, 'Wileen', 'http://dummyimage.com/229x100.png/cc0000/ffffff', 'wwardel5t@deviantart.com', 'qZ7nXmL9m3T5V82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (211, 'Giffy', 'http://dummyimage.com/173x100.png/cc0000/ffffff', 'gghione5u@buzzfeed.com', 'KZL9V5Tn7mXp3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (212, 'Dianna', 'http://dummyimage.com/225x100.png/dddddd/000000', 'dwilcock5v@cbsnews.com', 'm3T5ZK9n7Lp82VqX');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (213, 'Sharron', 'http://dummyimage.com/104x100.png/cc0000/ffffff', 'seskriett5w@ycombinator.com', 'P7mZ2gLx3aVq49F');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (214, 'Sheilakathryn', 'http://dummyimage.com/149x100.png/cc0000/ffffff', 'swinteringham5x@nbcnews.com', 'XmL72Qd8nTYp36K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (215, 'Brandi', 'http://dummyimage.com/186x100.png/5fa2dd/ffffff', 'bhalsey5y@dot.gov', 'Zp4nXw37MvL82gJ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (216, 'Ami', 'http://dummyimage.com/147x100.png/5fa2dd/ffffff', 'amoulton5z@printfriendly.com', 'T5vR8KqL32Xm9Nz');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (217, 'May', 'http://dummyimage.com/186x100.png/ff4444/ffffff', 'mcordey60@google.es', 'V3mYnKZ84XpTq65');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (218, 'Bess', 'http://dummyimage.com/183x100.png/5fa2dd/ffffff', 'bgalfour61@theatlantic.com', 'Lw92XMpT4Kv37nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (219, 'Pearline', 'http://dummyimage.com/249x100.png/5fa2dd/ffffff', 'psnowding62@purevolume.com', 'KqZ48YmT5Xp36Ln');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (220, 'Perle', 'http://dummyimage.com/175x100.png/dddddd/000000', 'pwahncke63@friendfeed.com', 'Xp37VnTq49L2KmZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (221, 'Damaris', 'http://dummyimage.com/115x100.png/ff4444/ffffff', 'dvanarsdalen64@flickr.com', 'ZnL8KqX5V3m72Tp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (222, 'Sula', 'http://dummyimage.com/191x100.png/dddddd/000000', 'sbroadstock65@bravesites.com', 'L2mXqK95T37p8nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (223, 'Nikolaus', 'http://dummyimage.com/238x100.png/cc0000/ffffff', 'natherley66@eventbrite.com', 'Tp82L3Vn4XmZ5Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (224, 'Alyse', 'http://dummyimage.com/238x100.png/cc0000/ffffff', 'agreathead67@ed.gov', 'n9KZ3XmL45p72Vq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (225, 'Jonas', 'http://dummyimage.com/155x100.png/5fa2dd/ffffff', 'jmaccaig68@privacy.gov.au', 'K5V7nT82L4qXmZ3');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (226, 'Odetta', 'http://dummyimage.com/116x100.png/dddddd/000000', 'ogrestie69@uiuc.edu', 'XpT9m3V2KZ4nL85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (227, 'Fianna', 'http://dummyimage.com/177x100.png/ff4444/ffffff', 'fhazelby6a@ning.com', 'TpXm37Z9L82V5nq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (228, 'Adele', 'http://dummyimage.com/211x100.png/5fa2dd/ffffff', 'astonebanks6b@tuttocitta.it', 'ZnT5mL2Xp37V8Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (229, 'Kayne', 'http://dummyimage.com/228x100.png/5fa2dd/ffffff', 'kavrahm6c@ask.com', 'L3n5VZq9K2m7XpT');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (230, 'Wallis', 'http://dummyimage.com/213x100.png/ff4444/ffffff', 'wcaudelier6d@upenn.edu', 'qXm82V5nT9m4Z3L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (231, 'Karrie', 'http://dummyimage.com/162x100.png/cc0000/ffffff', 'kmendoza6e@eepurl.com', 'VZ2m9XpT7L8n3Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (232, 'Eldridge', 'http://dummyimage.com/155x100.png/ff4444/ffffff', 'eboliver6f@cnet.com', 'L9VXpT2n5Z8K37m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (233, 'Nicolas', 'http://dummyimage.com/234x100.png/ff4444/ffffff', 'nblay6g@sakura.ne.jp', 'XpT7qZL5Vn9m38K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (234, 'Trey', 'http://dummyimage.com/166x100.png/5fa2dd/ffffff', 'tseddon6h@artisteer.com', 'Zn3V7KqT8L2Xp5m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (235, 'Jacinthe', 'http://dummyimage.com/186x100.png/5fa2dd/ffffff', 'jgeorgel6i@vinaora.com', 'Kq9mT5L37Zn82Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (236, 'Deanna', 'http://dummyimage.com/239x100.png/dddddd/000000', 'dhealeas6j@geocities.com', 'T5m9L3VZ82Kq7nXp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (237, 'Cornela', 'http://dummyimage.com/230x100.png/cc0000/ffffff', 'cbru6k@un.org', 'nXpVZ5qL2K7T3m8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (238, 'Perice', 'http://dummyimage.com/123x100.png/5fa2dd/ffffff', 'pbyrd6l@canalblog.com', 'q9m3nXp7VZ5KL8T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (239, 'Aeriela', 'http://dummyimage.com/238x100.png/cc0000/ffffff', 'abackler6m@yellowbook.com', 'm7nXp9T5V2ZKL3q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (240, 'Juline', 'http://dummyimage.com/242x100.png/dddddd/000000', 'jliggens6n@dell.com', 'Vq9mX7L5T3Zn82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (241, 'Kippy', 'http://dummyimage.com/126x100.png/cc0000/ffffff', 'kmacgilrewy6o@constantcontact.com', 'qT8nL3Xm9VZ5K7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (242, 'Arte', 'http://dummyimage.com/115x100.png/ff4444/ffffff', 'ajoist6p@pbs.org', 'Xm7T9nL5qV2ZK3m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (243, 'Morena', 'http://dummyimage.com/206x100.png/cc0000/ffffff', 'mwillimot6q@yelp.com', 'VZnq5T3L9mK7Xp8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (244, 'Dav', 'http://dummyimage.com/164x100.png/ff4444/ffffff', 'dnovik6r@blogs.com', 'q9L3VZ5KXm7T82n');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (245, 'Cordell', 'http://dummyimage.com/209x100.png/cc0000/ffffff', 'chandrock6s@ihg.com', 'VXmL3nZ5q8K9T7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (246, 'Tabatha', 'http://dummyimage.com/188x100.png/ff4444/ffffff', 'tdenacamp6t@cnbc.com', 'mL7nT9Kq5V82Z3Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (247, 'Garv', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff', 'gluscombe6u@psu.edu', 'VZ5K7TnLm93Xp82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (248, 'Lou', 'http://dummyimage.com/244x100.png/5fa2dd/ffffff', 'ldaveran6v@house.gov', 'TpXmL3n7KqV9Z85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (249, 'Anne', 'http://dummyimage.com/198x100.png/ff4444/ffffff', 'ageorghiou6w@tinypic.com', 'Xp9L3T7nZKq5mV82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (250, 'Brit', 'http://dummyimage.com/244x100.png/dddddd/000000', 'bdeville6x@army.mil', 'VXmZ5K9n3T7Lm82q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (251, 'Vivianna', 'http://dummyimage.com/137x100.png/ff4444/ffffff', 'vlilly6y@istockphoto.com', 'TpXm7KZL5V9n3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (252, 'Upton', 'http://dummyimage.com/189x100.png/cc0000/ffffff', 'utimson6z@alibaba.com', 'Xp9nL7m3KqZ5T82V');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (253, 'Lockwood', 'http://dummyimage.com/214x100.png/dddddd/000000', 'lokenden70@ask.com', 'Xm9qT5VZ3nK7Lp82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (254, 'Arly', 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'amanthroppe71@netvibes.com', 'KqXmT3nVZ9mL5p72');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (255, 'Erich', 'http://dummyimage.com/125x100.png/dddddd/000000', 'emallon72@addtoany.com', 'mVnL2qT5K9Z7Xp83');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (256, 'Ethelin', 'http://dummyimage.com/226x100.png/cc0000/ffffff', 'eandree73@vk.com', 'qT9K7nXpZ5Lm3V82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (257, 'Bank', 'http://dummyimage.com/232x100.png/ff4444/ffffff', 'bledgerton74@acquirethisname.com', 'Z5Lm9TqKXp3Vn7m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (258, 'Brantley', 'http://dummyimage.com/138x100.png/ff4444/ffffff', 'bdecayette75@indiatimes.com', 'nXp3VZ5L7q9mK82T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (259, 'Nikola', 'http://dummyimage.com/179x100.png/dddddd/000000', 'nscougall76@wordpress.com', 'T9mV5Lq7KXpZ3n82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (260, 'Carmel', 'http://dummyimage.com/188x100.png/dddddd/000000', 'cmurison77@hud.gov', 'L9T7KXmVq5nZ3m82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (261, 'Forbes', 'http://dummyimage.com/136x100.png/ff4444/ffffff', 'frevans78@usnews.com', 'nXm7L3T9Vq5ZK82m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (262, 'Vasili', 'http://dummyimage.com/232x100.png/cc0000/ffffff', 'vwardingley79@purevolume.com', 'm5n7qZ9T3VXpK82L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (263, 'Viviana', 'http://dummyimage.com/121x100.png/cc0000/ffffff', 'vtwatt7a@yolasite.com', 'qZ7nXmL9m3T5V82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (264, 'Colline', 'http://dummyimage.com/105x100.png/dddddd/000000', 'cbenesevich7b@baidu.com', 'KZL9V5Tn7mXp3q82');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (265, 'Toddy', 'http://dummyimage.com/169x100.png/ff4444/ffffff', 'twhittek7c@thetimes.co.uk', 'm3T5ZK9n7Lp82VqX');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (266, 'Jaynell', 'http://dummyimage.com/222x100.png/ff4444/ffffff', 'jdeboo7d@sogou.com', 'P7mZ2gLx3aVq49F');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (267, 'Malchy', 'http://dummyimage.com/230x100.png/5fa2dd/ffffff', 'mstiven7e@quantcast.com', 'XmL72Qd8nTYp36K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (268, 'Ricard', 'http://dummyimage.com/169x100.png/5fa2dd/ffffff', 'rtruett7f@europa.eu', 'Zp4nXw37MvL82gJ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (269, 'Gibb', 'http://dummyimage.com/205x100.png/ff4444/ffffff', 'gselland7g@google.com', 'T5vR8KqL32Xm9Nz');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (270, 'Link', 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', 'lackhurst7h@google.fr', 'V3mYnKZ84XpTq65');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (271, 'Minne', 'http://dummyimage.com/104x100.png/dddddd/000000', 'mgateland7i@senate.gov', 'Lw92XMpT4Kv37nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (272, 'Bartram', 'http://dummyimage.com/194x100.png/5fa2dd/ffffff', 'bewestace7j@aboutads.info', 'KqZ48YmT5Xp36Ln');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (273, 'Colin', 'http://dummyimage.com/204x100.png/cc0000/ffffff', 'cchattock7k@ucoz.com', 'Xp37VnTq49L2KmZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (274, 'Sonny', 'http://dummyimage.com/149x100.png/5fa2dd/ffffff', 'skell7l@alibaba.com', 'ZnL8KqX5V3m72Tp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (275, 'Rick', 'http://dummyimage.com/159x100.png/ff4444/ffffff', 'rpresidey7m@reverbnation.com', 'L2mXqK95T37p8nZ');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (276, 'Lacey', 'http://dummyimage.com/215x100.png/5fa2dd/ffffff', 'lluckin7n@usa.gov', 'Tp82L3Vn4XmZ5Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (277, 'Steffie', 'http://dummyimage.com/197x100.png/ff4444/ffffff', 'sgaskin7o@aboutads.info', 'n9KZ3XmL45p72Vq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (278, 'Joyous', 'http://dummyimage.com/229x100.png/cc0000/ffffff', 'jcardillo7p@pagesperso-orange.fr', 'K5V7nT82L4qXmZ3');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (279, 'Kermy', 'http://dummyimage.com/150x100.png/cc0000/ffffff', 'kcramphorn7q@slashdot.org', 'XpT9m3V2KZ4nL85');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (280, 'Tallie', 'http://dummyimage.com/212x100.png/cc0000/ffffff', 'tlivezey7r@facebook.com', 'TpXm37Z9L82V5nq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (281, 'Petr', 'http://dummyimage.com/240x100.png/dddddd/000000', 'pgoodlad7s@360.cn', 'ZnT5mL2Xp37V8Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (282, 'Elsy', 'http://dummyimage.com/108x100.png/cc0000/ffffff', 'emusso7t@netvibes.com', 'L3n5VZq9K2m7XpT');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (283, 'Rees', 'http://dummyimage.com/174x100.png/5fa2dd/ffffff', 'rhodinton7u@admin.ch', 'qXm82V5nT9m4Z3L');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (284, 'Orly', 'http://dummyimage.com/205x100.png/ff4444/ffffff', 'otantrum7v@admin.ch', 'VZ2m9XpT7L8n3Kq');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (285, 'Sela', 'http://dummyimage.com/206x100.png/ff4444/ffffff', 'scollete7w@mozilla.com', 'L9VXpT2n5Z8K37m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (286, 'Mariquilla', 'http://dummyimage.com/125x100.png/5fa2dd/ffffff', 'mtunniclisse7x@unc.edu', 'XpT7qZL5Vn9m38K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (287, 'Arline', 'http://dummyimage.com/217x100.png/ff4444/ffffff', 'amacandrew7y@networkadvertising.org', 'Zn3V7KqT8L2Xp5m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (288, 'Tally', 'http://dummyimage.com/211x100.png/cc0000/ffffff', 'thuerta7z@alexa.com', 'Kq9mT5L37Zn82Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (289, 'Fallon', 'http://dummyimage.com/107x100.png/5fa2dd/ffffff', 'fbundey80@sohu.com', 'T5m9L3VZ82Kq7nXp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (290, 'Dar', 'http://dummyimage.com/179x100.png/ff4444/ffffff', 'dwichard81@blogger.com', 'nXpVZ5qL2K7T3m8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (291, 'Shena', 'http://dummyimage.com/170x100.png/ff4444/ffffff', 'sjohnikin82@soup.io', 'q9m3nXp7VZ5KL8T');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (292, 'Deena', 'http://dummyimage.com/219x100.png/ff4444/ffffff', 'dvautrey83@blinklist.com', 'm7nXp9T5V2ZKL3q');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (293, 'Marga', 'http://dummyimage.com/217x100.png/ff4444/ffffff', 'mdaud84@godaddy.com', 'Vq9mX7L5T3Zn82K');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (294, 'Araldo', 'http://dummyimage.com/139x100.png/5fa2dd/ffffff', 'atroni85@theglobeandmail.com', 'qT8nL3Xm9VZ5K7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (295, 'Christi', 'http://dummyimage.com/152x100.png/cc0000/ffffff', 'cjurewicz86@squidoo.com', 'Xm7T9nL5qV2ZK3m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (296, 'Brose', 'http://dummyimage.com/142x100.png/cc0000/ffffff', 'bsproston87@columbia.edu', 'VZnq5T3L9mK7Xp8');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (297, 'Hartwell', 'http://dummyimage.com/210x100.png/5fa2dd/ffffff', 'hlewcock88@guardian.co.uk', 'q9L3VZ5KXm7T82n');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (298, 'Andrej', 'http://dummyimage.com/132x100.png/5fa2dd/ffffff', 'alaybourn89@last.fm', 'VXmL3nZ5q8K9T7m');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (299, 'Aldis', 'http://dummyimage.com/208x100.png/cc0000/ffffff', 'aquarless8a@gizmodo.com', 'mL7nT9Kq5V82Z3Xp');
INSERT INTO usuarios (id, nombre, url_imagen, correo, contrasenha) VALUES (300, 'Karel', 'http://dummyimage.com/179x100.png/5fa2dd/ffffff', 'kbloxland8b@weibo.com', 'VZ5K7TnLm93Xp82q');

-- migrate:up
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1014496537', 1);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1089551287', 3);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1026209015', 5);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1013749046', 7);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1002700057', 9);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1096409709', 11);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1017147504', 13);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1003420864', 15);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1023235372', 17);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1078524792', 19);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1066986557', 21);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1013388449', 23);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1021469954', 25);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1001658456', 27);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1088109504', 29);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1087275901', 31);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1091383205', 33);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1086419682', 35);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1098859532', 37);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1005034412', 39);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1079693832', 41);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1060402134', 43);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1008155902', 45);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1029588201', 47);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1087979822', 49);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1059992346', 51);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1017873244', 53);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1012844159', 55);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1059328974', 57);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1055015084', 59);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1040089964', 61);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1017388525', 63);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1091082244', 65);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1046840826', 67);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1001609478', 69);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1087315626', 71);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1025080338', 73);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1062548693', 75);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1025913034', 77);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1053009785', 79);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1092317704', 81);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1018002722', 83);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1080736398', 85);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1006402907', 87);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1040564981', 89);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1002653687', 91);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1089865242', 93);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1046006401', 95);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1055009905', 97);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1063796053', 99);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1065331282', 101);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1003030954', 103);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1005390089', 105);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1062192175', 107);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1040954247', 109);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1013697521', 111);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1024779181', 113);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1058975484', 115);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1084384194', 117);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1004958476', 119);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1016896346', 121);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1040106306', 123);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1011262669', 125);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1096711482', 127);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1018672161', 129);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1017154506', 131);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1016564486', 133);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1070100597', 135);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1010709889', 137);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1025165231', 139);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1039083933', 141);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1048473083', 143);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1041789252', 145);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1003808927', 147);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1004225119', 149);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1058135645', 151);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1034951908', 153);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1017535296', 155);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1073580988', 157);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1064483488', 159);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1068773496', 161);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1036799847', 163);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1014148673', 165);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1014734917', 167);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1024655666', 169);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1057314521', 171);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1014319929', 173);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1013745295', 175);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1006452017', 177);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1004065797', 179);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1003935397', 181);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1091457365', 183);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1097339588', 185);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1092800833', 187);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1083857983', 189);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1083036616', 191);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1002819187', 193);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1044440269', 195);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1045941742', 197);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1079829068', 199);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1061644598', 201);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1099243417', 203);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1056605451', 205);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1024009281', 207);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1059445979', 209);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1066852162', 211);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1098712192', 213);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1050056523', 215);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1085785772', 217);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1098032267', 219);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1019677553', 221);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1021256805', 223);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1035917029', 225);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1020766322', 227);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1054480125', 229);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1008833947', 231);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1014405478', 233);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1028072576', 235);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1055326006', 237);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1049338655', 239);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1055936992', 241);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1095111174', 243);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1007083154', 245);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1069558591', 247);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1057604272', 249);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1014686931', 251);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1034029717', 253);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1058323449', 255);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1080385988', 257);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1009911757', 259);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1027413858', 261);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1011511666', 263);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1062003122', 265);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1029044091', 267);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1068095633', 269);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1007447809', 271);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1086476455', 273);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1014196143', 275);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1014517046', 277);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1045866868', 279);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1067376167', 281);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1066591509', 283);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1011360534', 285);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1018469639', 287);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1046518724', 289);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1081001263', 291);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1022486699', 293);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1091374151', 295);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1049427829', 297);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('1061185207', 299);

INSERT INTO usuarios_analista (id_usuario) VALUES (100);
INSERT INTO usuarios_analista (id_usuario) VALUES (200);
INSERT INTO usuarios_analista (id_usuario) VALUES (300);

-- migrate:up
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV002', 2);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV004', 4);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV006', 6);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV008', 8);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV010', 10);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV012', 12);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV014', 14);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV016', 16);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV018', 18);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV020', 20);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV022', 22);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV024', 24);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV026', 26);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV028', 28);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV030', 30);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV032', 32);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV034', 34);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV036', 36);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV038', 38);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV040', 40);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV042', 42);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV044', 44);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV046', 46);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV048', 48);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV050', 50);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV052', 52);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV054', 54);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV056', 56);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV058', 58);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV060', 60);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV062', 62);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV064', 64);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV066', 66);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV068', 68);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV070', 70);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV072', 72);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV074', 74);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV076', 76);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV078', 78);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV080', 80);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV082', 82);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV084', 84);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV086', 86);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV088', 88);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV090', 90);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV092', 92);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV094', 94);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV096', 96);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV098', 98);

INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV102', 102);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV104', 104);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV106', 106);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV108', 108);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV110', 110);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV112', 112);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV114', 114);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV116', 116);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV118', 118);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV120', 120);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV122', 122);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV124', 124);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV126', 126);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV128', 128);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV130', 130);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV132', 132);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV134', 134);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV136', 136);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV138', 138);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV140', 140);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV142', 142);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV144', 144);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV146', 146);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV148', 148);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV150', 150);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV152', 152);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV154', 154);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV156', 156);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV158', 158);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV160', 160);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV162', 162);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV164', 164);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV166', 166);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV168', 168);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV170', 170);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV172', 172);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV174', 174);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV176', 176);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV178', 178);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV180', 180);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV182', 182);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV184', 184);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV186', 186);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV188', 188);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV190', 190);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV192', 192);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV194', 194);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV196', 196);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV198', 198);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV202', 202);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV204', 204);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV206', 206);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV208', 208);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV210', 210);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV212', 212);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV214', 214);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV216', 216);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV218', 218);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV220', 220);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV222', 222);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV224', 224);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV226', 226);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV228', 228);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV230', 230);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV232', 232);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV234', 234);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV236', 236);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV238', 238);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV240', 240);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV242', 242);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV244', 244);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV246', 246);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV248', 248);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV250', 250);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV252', 252);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV254', 254);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV256', 256);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV258', 258);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV260', 260);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV262', 262);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV264', 264);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV266', 266);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV268', 268);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV270', 270);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV272', 272);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV274', 274);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV276', 276);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV278', 278);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV280', 280);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV282', 282);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV284', 284);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV286', 286);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV288', 288);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV290', 290);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV292', 292);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV294', 294);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV296', 296);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV298', 298);

INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto A', '2024-01-01', 1);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto B', '2024-02-15', 2);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto C', '2024-03-20', 3);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto D', '2024-04-10', 4);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto E', '2024-05-25', 5);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto F', '2024-06-05', 6);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto G', '2024-07-17', 7);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto H', '2024-08-30', 8);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto I', '2024-09-14', 9);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto J', '2024-10-02', 10);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto K', '2024-11-06', 11);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto L', '2024-12-12', 12);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto M', '2025-01-09', 13);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto N', '2025-02-20', 14);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto O', '2025-03-30', 15);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto P', '2025-04-25', 16);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto Q', '2025-05-15', 17);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto R', '2025-06-02', 18);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto S', '2025-07-12', 19);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto T', '2025-08-25', 20);

-- migrate:up
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia A', 'Descripción de la incidencia A', '2024-01-01 10:00:00', '2024-01-02 14:00:00', 1, 1, 1, 1, 2);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia B', 'Descripción de la incidencia B', '2024-02-15 09:00:00', '2024-02-16 15:30:00', 2, 2, 2, 2, 4);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia C', 'Descripción de la incidencia C', '2024-03-20 08:30:00', '2024-03-21 10:45:00', 3, 3, 3, 3, 6);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia D', 'Descripción de la incidencia D', '2024-04-10 11:00:00', '2024-04-11 13:30:00', 4, 4, 4, 4, 8);

-- Incidencia E
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia E', 'Descripción de la incidencia E', '2024-05-05 16:00:00', '2024-05-06 18:00:00', 5, 5, 1, 2, 10);

-- Incidencia F
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia F', 'Descripción de la incidencia F', '2024-06-01 12:00:00', '2024-06-02 14:00:00', 6, 6, 2, 3, 12);

-- Incidencia G
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia G', 'Descripción de la incidencia G', '2024-07-01 13:00:00', '2024-07-02 15:00:00', 7, 7, 3, 1, 14);

-- Incidencia H
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia H', 'Descripción de la incidencia H', '2024-08-01 14:00:00', '2024-08-02 16:00:00', 8, 8, 4, 2, 16);

-- Incidencia I
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia I', 'Descripción de la incidencia I', '2024-09-01 17:00:00', '2024-09-02 19:00:00', 9, 9, 1, 4, 18);

-- Incidencia J
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia J', 'Descripción de la incidencia J', '2024-10-01 18:00:00', '2024-10-02 20:00:00', 10, 10, 2, 3, 20);

INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (2, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (2, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (2, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (2, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (2, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (4, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (6, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (6, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (6, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (6, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (6, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (8, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (8, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (8, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (10, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (10, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (10, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (12, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (12, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (12, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (12, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (12, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (12, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (12, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (14, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (14, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (14, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (14, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (16, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (18, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (18, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (18, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (18, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (18, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (20, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (20, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (20, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (20, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (20, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (20, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (20, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (22, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (22, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (22, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (22, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (22, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (22, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (22, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (24, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (24, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (26, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (26, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (26, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (26, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (28, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (28, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (28, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (28, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (28, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (28, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (28, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (28, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (30, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (32, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (32, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (32, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (32, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (32, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (32, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (32, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (34, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (36, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (36, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (38, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (40, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (40, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (40, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (40, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (40, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (40, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (40, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (42, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (42, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (42, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (42, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (42, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (44, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (46, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (46, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (48, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (48, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (48, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (48, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (48, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (48, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (50, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (50, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (50, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (50, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (50, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (50, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (50, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (52, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (52, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (52, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (52, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (54, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (54, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (54, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (54, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (54, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (54, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (54, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (54, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (56, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (56, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (56, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (56, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (58, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (60, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (60, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (62, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (64, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (64, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (66, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (66, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (66, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (66, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (66, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (66, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (68, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (68, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (68, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (70, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (70, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (70, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (70, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (70, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (70, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (72, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (74, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (74, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (74, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (74, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (74, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (74, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (74, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (74, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (76, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (76, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (76, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (76, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (76, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (76, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (76, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (76, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (78, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (78, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (80, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (82, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (82, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (82, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (82, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (82, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (84, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (84, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (84, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (84, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (84, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (84, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (84, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (86, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (88, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (90, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (90, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (90, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (90, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (90, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (92, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (92, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (92, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (92, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (92, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (92, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (92, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (94, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (94, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (94, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (94, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (96, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (96, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (96, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (98, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (98, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (100, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (102, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (104, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (104, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (104, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (104, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (104, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (104, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (104, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (104, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (106, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (108, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (108, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (108, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (108, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (108, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (110, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (110, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (110, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (110, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (110, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (112, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (112, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (112, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (112, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (112, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (112, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (114, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (114, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (114, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (116, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (118, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (118, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (118, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (120, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (120, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (120, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (120, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (120, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (120, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (122, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (124, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (124, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (124, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (124, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (124, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (124, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (124, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (124, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (126, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (128, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (130, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (132, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (132, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (132, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (132, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (134, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (136, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (136, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (136, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (136, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (136, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (136, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (136, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (136, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (138, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (140, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (142, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (142, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (142, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (142, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (142, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (142, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (142, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (144, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (144, 7);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (144, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (144, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (144, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (144, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (144, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (144, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (146, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (146, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (146, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (146, 9);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (146, 6);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (146, 10);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (146, 8);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (146, 1);



INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 1', '2024-11-25 16:21:16', 2, 141);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 2', '2024-11-25 16:21:16', 2, 107);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 3', '2024-11-29 16:21:16', 2, 113);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 4', '2024-11-29 16:21:16', 1, 28);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 5', '2024-11-02 16:21:16', 2, 128);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 6', '2024-11-16 16:21:16', 2, 17);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 7', '2024-11-20 16:21:16', 1, 50);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 8', '2024-11-27 16:21:16', 2, 63);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 9', '2024-11-07 16:21:16', 3, 66);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 10', '2024-11-29 16:21:16', 1, 54);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 11', '2024-11-06 16:21:16', 2, 87);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 12', '2024-11-03 16:21:16', 2, 48);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 13', '2024-11-14 16:21:16', 3, 88);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 14', '2024-11-29 16:21:16', 1, 114);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 15', '2024-11-30 16:21:16', 1, 95);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 16', '2024-11-28 16:21:16', 1, 77);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 17', '2024-12-01 16:21:16', 3, 96);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 18', '2024-11-29 16:21:16', 1, 30);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 19', '2024-11-03 16:21:16', 1, 53);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 20', '2024-11-19 16:21:16', 1, 143);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 21', '2024-11-03 16:21:16', 2, 58);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 22', '2024-11-28 16:21:16', 1, 115);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 23', '2024-11-30 16:21:16', 3, 139);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 24', '2024-11-08 16:21:16', 2, 135);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 25', '2024-11-21 16:21:16', 1, 131);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 26', '2024-11-25 16:21:16', 1, 144);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 27', '2024-11-14 16:21:16', 2, 97);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 28', '2024-11-12 16:21:16', 2, 70);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 29', '2024-11-24 16:21:16', 1, 107);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 30', '2024-11-13 16:21:16', 3, 136);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 31', '2024-11-06 16:21:16', 1, 138);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 32', '2024-11-07 16:21:16', 2, 146);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 33', '2024-11-30 16:21:16', 2, 109);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 34', '2024-11-05 16:21:16', 1, 13);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 35', '2024-11-25 16:21:16', 3, 34);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 36', '2024-11-15 16:21:16', 1, 77);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 37', '2024-11-15 16:21:16', 2, 101);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 38', '2024-11-17 16:21:16', 2, 50);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 39', '2024-12-01 16:21:16', 1, 12);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 40', '2024-11-26 16:21:16', 2, 111);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 41', '2024-11-06 16:21:16', 3, 129);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 42', '2024-11-27 16:21:16', 2, 105);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 43', '2024-11-02 16:21:16', 3, 72);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 44', '2024-11-06 16:21:16', 3, 10);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 45', '2024-12-01 16:21:16', 2, 113);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 46', '2024-11-29 16:21:16', 2, 94);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 47', '2024-11-18 16:21:16', 2, 50);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 48', '2024-11-29 16:21:16', 2, 47);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 49', '2024-11-20 16:21:16', 3, 48);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 50', '2024-11-25 16:21:16', 2, 84);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 51', '2024-11-05 16:21:16', 1, 72);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 52', '2024-12-01 16:21:16', 1, 118);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 53', '2024-11-15 16:21:16', 2, 30);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 54', '2024-11-25 16:21:16', 1, 18);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 55', '2024-11-07 16:21:16', 3, 66);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 56', '2024-11-07 16:21:16', 2, 25);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 57', '2024-11-24 16:21:16', 1, 132);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 58', '2024-11-24 16:21:16', 1, 116);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 59', '2024-11-19 16:21:16', 1, 107);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 60', '2024-11-08 16:21:16', 2, 147);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 61', '2024-11-12 16:21:16', 1, 15);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 62', '2024-11-01 16:21:16', 2, 22);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 63', '2024-11-07 16:21:16', 2, 9);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 64', '2024-11-02 16:21:16', 2, 48);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 65', '2024-11-18 16:21:16', 1, 130);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 66', '2024-11-13 16:21:16', 1, 41);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 67', '2024-12-01 16:21:16', 2, 115);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 68', '2024-11-14 16:21:16', 3, 9);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 69', '2024-11-01 16:21:16', 1, 47);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 70', '2024-11-20 16:21:16', 3, 42);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 71', '2024-11-28 16:21:16', 1, 16);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 72', '2024-11-25 16:21:16', 3, 127);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 73', '2024-11-11 16:21:16', 2, 32);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 74', '2024-11-18 16:21:16', 2, 12);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 75', '2024-11-15 16:21:16', 2, 12);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 76', '2024-11-20 16:21:16', 1, 137);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 77', '2024-11-02 16:21:16', 3, 120);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 78', '2024-11-25 16:21:16', 3, 37);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 79', '2024-11-21 16:21:16', 2, 30);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 80', '2024-11-01 16:21:16', 1, 133);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 81', '2024-11-12 16:21:16', 2, 6);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 82', '2024-11-22 16:21:16', 2, 80);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 83', '2024-11-26 16:21:16', 3, 49);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 84', '2024-11-30 16:21:16', 1, 119);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 85', '2024-11-12 16:21:16', 1, 16);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 86', '2024-11-14 16:21:16', 2, 144);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 87', '2024-11-17 16:21:16', 3, 50);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 88', '2024-11-30 16:21:16', 2, 138);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 89', '2024-11-21 16:21:16', 1, 119);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 90', '2024-11-22 16:21:16', 3, 36);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 91', '2024-11-16 16:21:16', 2, 60);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 92', '2024-11-28 16:21:16', 2, 122);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 93', '2024-11-11 16:21:16', 1, 119);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 94', '2024-11-25 16:21:16', 1, 24);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 95', '2024-11-28 16:21:16', 3, 89);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 96', '2024-11-11 16:21:16', 2, 21);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 97', '2024-12-01 16:21:16', 1, 51);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 98', '2024-11-26 16:21:16', 2, 122);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 99', '2024-11-30 16:21:16', 3, 9);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 100', '2024-11-26 16:21:16', 2, 78);

-- migrate:up
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 1', '2024-11-25 16:21:16', 2, 141);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 2', '2024-11-25 16:21:16', 2, 107);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 3', '2024-11-29 16:21:16', 2, 113);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 4', '2024-11-29 16:21:16', 1, 28);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 5', '2024-11-02 16:21:16', 2, 128);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 6', '2024-11-16 16:21:16', 2, 17);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 7', '2024-11-20 16:21:16', 1, 50);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 8', '2024-11-27 16:21:16', 2, 63);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 9', '2024-11-07 16:21:16', 3, 66);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 10', '2024-11-29 16:21:16', 1, 54);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 11', '2024-11-06 16:21:16', 2, 87);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 12', '2024-11-03 16:21:16', 2, 48);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 13', '2024-11-14 16:21:16', 3, 88);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 14', '2024-11-29 16:21:16', 1, 114);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 15', '2024-11-30 16:21:16', 1, 95);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 16', '2024-11-28 16:21:16', 1, 77);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 17', '2024-12-01 16:21:16', 3, 96);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 18', '2024-11-29 16:21:16', 1, 30);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 19', '2024-11-03 16:21:16', 1, 53);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 20', '2024-11-19 16:21:16', 1, 143);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 21', '2024-11-03 16:21:16', 2, 58);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 22', '2024-11-28 16:21:16', 1, 115);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 23', '2024-11-30 16:21:16', 3, 139);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 24', '2024-11-08 16:21:16', 2, 135);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 25', '2024-11-21 16:21:16', 1, 131);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 26', '2024-11-25 16:21:16', 1, 144);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 27', '2024-11-14 16:21:16', 2, 97);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 28', '2024-11-12 16:21:16', 2, 70);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 29', '2024-11-24 16:21:16', 1, 107);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 30', '2024-11-13 16:21:16', 3, 136);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 31', '2024-11-06 16:21:16', 1, 138);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 32', '2024-11-07 16:21:16', 2, 146);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 33', '2024-11-30 16:21:16', 2, 109);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 34', '2024-11-05 16:21:16', 1, 13);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 35', '2024-11-25 16:21:16', 3, 34);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 36', '2024-11-15 16:21:16', 1, 77);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 37', '2024-11-15 16:21:16', 2, 101);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 38', '2024-11-17 16:21:16', 2, 50);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 39', '2024-12-01 16:21:16', 1, 12);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 40', '2024-11-26 16:21:16', 2, 111);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 41', '2024-11-06 16:21:16', 3, 129);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 42', '2024-11-27 16:21:16', 2, 105);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 43', '2024-11-02 16:21:16', 3, 72);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 44', '2024-11-06 16:21:16', 3, 10);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 45', '2024-12-01 16:21:16', 2, 113);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 46', '2024-11-29 16:21:16', 2, 94);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 47', '2024-11-18 16:21:16', 2, 50);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 48', '2024-11-29 16:21:16', 2, 47);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 49', '2024-11-20 16:21:16', 3, 48);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 50', '2024-11-25 16:21:16', 2, 84);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 51', '2024-11-05 16:21:16', 1, 72);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 52', '2024-12-01 16:21:16', 1, 118);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 53', '2024-11-15 16:21:16', 2, 30);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 54', '2024-11-25 16:21:16', 1, 18);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 55', '2024-11-07 16:21:16', 3, 66);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 56', '2024-11-07 16:21:16', 2, 25);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 57', '2024-11-24 16:21:16', 1, 132);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 58', '2024-11-24 16:21:16', 1, 116);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 59', '2024-11-19 16:21:16', 1, 107);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 60', '2024-11-08 16:21:16', 2, 147);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 61', '2024-11-12 16:21:16', 1, 15);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 62', '2024-11-01 16:21:16', 2, 22);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 63', '2024-11-07 16:21:16', 2, 9);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 64', '2024-11-02 16:21:16', 2, 48);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 65', '2024-11-18 16:21:16', 1, 130);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 66', '2024-11-13 16:21:16', 1, 41);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 67', '2024-12-01 16:21:16', 2, 115);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 68', '2024-11-14 16:21:16', 3, 9);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 69', '2024-11-01 16:21:16', 1, 47);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 70', '2024-11-20 16:21:16', 3, 42);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 71', '2024-11-28 16:21:16', 1, 16);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 72', '2024-11-25 16:21:16', 3, 127);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 73', '2024-11-11 16:21:16', 2, 32);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 74', '2024-11-18 16:21:16', 2, 12);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 75', '2024-11-15 16:21:16', 2, 12);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 76', '2024-11-20 16:21:16', 1, 137);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 77', '2024-11-02 16:21:16', 3, 120);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 78', '2024-11-25 16:21:16', 3, 37);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 79', '2024-11-21 16:21:16', 2, 30);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 80', '2024-11-01 16:21:16', 1, 133);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 81', '2024-11-12 16:21:16', 2, 6);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 82', '2024-11-22 16:21:16', 2, 80);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 83', '2024-11-26 16:21:16', 3, 49);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 84', '2024-11-30 16:21:16', 1, 119);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 85', '2024-11-12 16:21:16', 1, 16);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 86', '2024-11-14 16:21:16', 2, 144);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 87', '2024-11-17 16:21:16', 3, 50);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 88', '2024-11-30 16:21:16', 2, 138);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 89', '2024-11-21 16:21:16', 1, 119);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 90', '2024-11-22 16:21:16', 3, 36);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 91', '2024-11-16 16:21:16', 2, 60);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 92', '2024-11-28 16:21:16', 2, 122);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 93', '2024-11-11 16:21:16', 1, 119);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 94', '2024-11-25 16:21:16', 1, 24);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 95', '2024-11-28 16:21:16', 3, 89);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 96', '2024-11-11 16:21:16', 2, 21);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 97', '2024-12-01 16:21:16', 1, 51);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 98', '2024-11-26 16:21:16', 2, 122);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 99', '2024-11-30 16:21:16', 3, 9);
INSERT INTO comentarios (contenido, fecha, id_analista, id_developer) VALUES ('Comentario de prueba 100', '2024-11-26 16:21:16', 2, 78);



INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (41, 55);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (85, 69);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (1, 75);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (39, 96);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (39, 3);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (69, 2);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (57, 95);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (67, 14);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (45, 64);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (51, 80);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (1, 34);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (91, 52);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (57, 45);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (55, 45);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (53, 26);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (29, 62);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (19, 31);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (19, 21);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (55, 39);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (83, 30);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (79, 26);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (91, 34);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (55, 34);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (79, 15);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (83, 56);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (39, 2);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (5, 95);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (45, 15);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (27, 28);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (9, 81);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (93, 69);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (11, 25);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (53, 92);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (31, 44);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (61, 47);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (29, 75);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (65, 9);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (89, 9);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (99, 56);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (55, 77);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (89, 17);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (85, 40);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (81, 83);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (49, 87);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (57, 65);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (87, 43);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (83, 22);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (17, 32);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (89, 4);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (65, 58);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (13, 63);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (79, 78);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (49, 2);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (1, 33);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (27, 97);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (71, 11);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (67, 34);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (55, 59);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (75, 62);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (77, 42);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (33, 68);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (17, 98);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (61, 65);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (63, 41);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (63, 33);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (29, 31);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (9, 57);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (69, 98);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (29, 17);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (13, 43);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (43, 75);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (11, 90);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (45, 27);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (25, 54);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (87, 97);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (15, 68);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (43, 63);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (15, 84);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (37, 40);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (75, 78);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (33, 43);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (71, 22);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (87, 85);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (55, 40);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (19, 65);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (1, 25);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (9, 40);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (61, 51);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (49, 33);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (33, 19);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (71, 71);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (55, 75);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (57, 40);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (7, 85);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (9, 8);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (65, 14);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (79, 78);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (11, 28);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (3, 99);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (9, 2);

INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (9, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (3, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (7, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (10, 2);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (3, 3);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (7, 3);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (6, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (4, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (8, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (6, 5);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (1, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (5, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (8, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (2, 7);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (2, 8);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (10, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (5, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (9, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (2, 10);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (4, 10);

INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (1, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (2, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (3, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (4, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (5, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (6, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (7, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (8, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (9, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (10, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (5, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (3, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (8, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (7, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (6, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (2, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (4, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (1, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (9, 2);

INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (1, 147);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (2, 102);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (3, 56);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (4, 73);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (5, 101);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (6, 23);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (7, 89);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (8, 140);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (9, 19);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (10, 65);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (1, 11);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (2, 37);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (3, 59);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (4, 42);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (5, 124);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (6, 147);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (7, 3);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (8, 99);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (9, 25);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (10, 108);

INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (1, 1); -- Incidencia A es Urgente
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (1, 2); -- Incidencia A también es un Bug
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (2, 3); -- Incidencia B es una Mejora
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (2, 4); -- Incidencia B está en Producción
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (3, 5); -- Incidencia C requiere Documentación
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (4, 1); -- Incidencia D es Urgente
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (4, 3); -- Incidencia D es una Mejora
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (5, 2); -- Incidencia E es un Bug
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (5, 4); -- Incidencia E está en Producción
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (6, 5); -- Incidencia F requiere Documentación
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (7, 1); -- Incidencia G es Urgente
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (8, 2); -- Incidencia H es un Bug
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (9, 3); -- Incidencia I es una Mejora
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (10, 4); -- Incidencia J está en Producción

-- migrate:up









