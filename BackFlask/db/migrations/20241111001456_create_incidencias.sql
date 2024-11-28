-- migrate:up
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
-- migrate:down
DROP TABLE incidencias;
