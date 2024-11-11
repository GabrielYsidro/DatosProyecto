-- migrate:up
CREATE TABLE estados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL,
    url_imagen VARCHAR(200)
);
-- migrate:down
DROP TABLE estados;