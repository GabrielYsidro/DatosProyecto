-- migrate:up
CREATE TABLE departamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL
);
-- migrate:down
DROP TABLE departamentos;