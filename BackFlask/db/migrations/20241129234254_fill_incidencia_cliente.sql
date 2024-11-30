-- migrate:up
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (9, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (3, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (7, 1);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (11, 2);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (13, 3);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (17, 3);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (6, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (4, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (18, 4);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (16, 5);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (1, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (15, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (8, 6);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (20, 7);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (12, 8);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (10, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (5, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (19, 9);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (2, 10);
INSERT INTO incidencia_cliente (id_incidencia, id_usuario) VALUES (14, 10);



-- migrate:down
DROP TABLE incidencia_cliente;
