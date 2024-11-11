-- migrate:up
CREATE TABLE usuarios_analista (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- migrate:down
DROP TABLE usuarios_analista;
