-- migrate:up
CREATE TABLE incidencia_developer(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);
-- migrate:down
DROP TABLE incidencia_developer;