-- migrate:up
CREATE TABLE departamentos_proyecto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_departamento INTEGER NOT NULL,
    id_proyecto INTEGER NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id),
    FOREIGN KEY (id_proyecto) REFERENCES proyectos(id)
);
-- migrate:down
DROP TABLE departamentos_proyecto;
