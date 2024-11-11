-- migrate:up
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL,
    url_imagen VARCHAR(200),
    correo VARCHAR(100) NOT NULL,
    contrasenha VARCHAR(100) NOT NULL
    );
-- migrate:down
DROP TABLE usuarios;
