-- migrate:up
CREATE TABLE incidencia_analista(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_analista INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_analista) REFERENCES usuarios_analista(id)
);
-- migrate:down
DROP TABLE incidencia_analista;
