-- migrate:up
-- Insertar 20 registros en la tabla `incidencia_analista`
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (1, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (2, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (3, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (4, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (5, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (6, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (7, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (8, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (9, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (10, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (5, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (3, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (8, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (7, 2);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (6, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (2, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (4, 3);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (1, 1);
INSERT INTO incidencia_analista (id_incidencia, id_analista) VALUES (9, 2);

-- migrate:down
DELETE FROM incidencia_analista;