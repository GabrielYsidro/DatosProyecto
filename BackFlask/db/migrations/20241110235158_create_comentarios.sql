-- migrate:up
CREATE TABLE comentarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    contenido VARCHAR(200) NOT NULL,
    fecha DATETIME NOT NULL,
    id_analista INTEGER,
    id_developer INTEGER,
    FOREIGN KEY (id_analista) REFERENCES usuarios_analista(id),
    FOREIGN KEY (id_developer) REFERENCES usuarios_developer(id)
    );
-- migrate:down
DROP TABLE comentarios;