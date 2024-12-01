-- migrate:up
CREATE TABLE etiquetas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL
);
-- migrate:down
DROP TABLE etiquetas;