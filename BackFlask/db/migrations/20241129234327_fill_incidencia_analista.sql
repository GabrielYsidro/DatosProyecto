-- migrate:up
-- Insertar 20 registros en la tabla `incidencia_analista`
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (1, 1);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (2, 2);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (3, 3);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (4, 4);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (5, 5);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (6, 6);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (7, 7);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (8, 8);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (9, 9);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (10, 10);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (11, 11);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (12, 12);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (13, 13);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (14, 14);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (15, 15);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (16, 16);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (17, 17);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (18, 18);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (19, 19);
INSERT INTO incidencia_analista (id_incidencia, id_usuario) VALUES (20, 20);

-- migrate:down
DROP TABLE incidencia_analista;
