-- migrate:up
CREATE TABLE prioridades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(20) NOT NULL
);

-- migrate:down
DROP TABLE prioridades;