-- migrate:up
CREATE TABLE usuarios_cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ruc VARCHAR(20) NOT NULL,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
    );
-- migrate:down
DROP TABLE usuarios_cliente;
