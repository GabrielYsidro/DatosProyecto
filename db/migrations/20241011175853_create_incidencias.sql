-- migrate:up

CREATE TABLE incidencias (
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    descripcion TEXT NOT NULL,
    estado BOOLEAN NOT NULL,
    id_usuario INTEGER NOT NULL,
    id_tipo_incidencia INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_tipo_incidencia) REFERENCES tipos_incidencias(id)
);
-- migrate:down

DROP TABLE incidencias;

