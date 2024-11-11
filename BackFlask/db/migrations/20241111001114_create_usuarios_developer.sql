-- migrate:up
CREATE TABLE usuarios_developer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo VARCHAR(20) NOT NULL,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- migrate:down
DROP TABLE usuarios_developer;
