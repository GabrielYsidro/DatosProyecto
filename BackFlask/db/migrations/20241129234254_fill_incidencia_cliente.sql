-- migrate:up
-- Insertar 20 registros en la tabla `incidencia_cliente`
INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (1, 1);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (2, 2);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (3, 3);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (4, 4);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (5, 5);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (6, 6);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (7, 7);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (8, 8);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (9, 9);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (10, 10);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (11, 1);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (12, 2);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (13, 3);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (14, 4);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (15, 5);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (16, 6);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (17, 7);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (18, 8);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (19, 9);

INSERT INTO incidencia_cliente (id_incidencia, id_usuario)
VALUES (20, 10);

-- migrate:down
-- Borrar la tabla 'incidencia_cliente'
DROP TABLE incidencia_cliente;
