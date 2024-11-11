-- migrate:up
CREATE TABLE comentarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    contenido VARCHAR(200) NOT NULL,
    fecha DATETIME NOT NULL,
    id_analista INTEGER,
    id_developer INTEGER,
    FOREIGN KEY (id_analista) REFERENCES analistas(id),
    FOREIGN KEY (id_developer) REFERENCES developers(id)
    );
-- migrate:down
DROP TABLE comentarios;