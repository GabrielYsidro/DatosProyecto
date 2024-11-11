-- migrate:up
CREATE TABLE developer_departamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_developer INTEGER NOT NULL,
    id_departamento INTEGER NOT NULL,
    FOREIGN KEY (id_developer) REFERENCES usuarios_developer(id),
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

-- migrate:down
DROP TABLE developer_departamentos;
