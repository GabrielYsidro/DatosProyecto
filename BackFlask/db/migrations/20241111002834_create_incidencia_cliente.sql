-- migrate:up
CREATE TABLE incidencia_cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_incidencia INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    FOREIGN KEY (id_incidencia) REFERENCES incidencias(id),
    FOREIGN KEY (id_cliente) REFERENCES usuarios_cliente(id)
);
-- migrate:down
DROP TABLE incidencia_cliente;
