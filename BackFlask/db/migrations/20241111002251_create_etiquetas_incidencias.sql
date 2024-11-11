-- migrate:up
CREATE TABLE etiquetas_incidencias(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_etiqueta INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_etiqueta) REFERENCES etiquetas(id)
);
-- migrate:down
DROP TABLE etiquetas_incidencias;
