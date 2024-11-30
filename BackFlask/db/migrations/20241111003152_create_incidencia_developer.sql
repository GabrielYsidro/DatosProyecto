-- migrate:up
CREATE TABLE incidencia_developer(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_developer INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_developer) REFERENCES usuarios_developer(id)
);
-- migrate:down
DROP TABLE incidencia_developer;