-- migrate:up
-- Insertar 20 registros en la tabla `incidencia_analista`
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (1, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (2, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (3, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (4, 4);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (5, 5);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (6, 6);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (7, 7);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (8, 8);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (9, 9);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (10, 10);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (11, 11);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (12, 12);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (13, 13);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (14, 14);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (15, 15);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (16, 16);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (17, 17);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (18, 18);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (19, 19);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (20, 20);

-- migrate:down
DELETE FROM incidencia_analista;