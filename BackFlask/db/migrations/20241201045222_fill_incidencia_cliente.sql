-- migrate:up
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (9, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (3, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (7, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (11, 2);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (13, 3);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (17, 3);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (6, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (4, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (18, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (16, 5);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (1, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (15, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (8, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (20, 7);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (12, 8);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (10, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (5, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (19, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (2, 10);
INSERT INTO incidencia_cliente (id_incidencia, id_cliente) VALUES (14, 10);



-- migrate:down
DELETE FROM incidencia_cliente;