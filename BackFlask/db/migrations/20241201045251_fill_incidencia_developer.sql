-- migrate:up
-- Insertar registros en la tabla incidencia_developer
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (1, 147);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (2, 102);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (3, 56);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (4, 73);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (5, 101);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (6, 23);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (7, 89);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (8, 140);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (9, 19);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (10, 65);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (1, 11);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (2, 37);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (3, 59);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (4, 42);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (5, 124);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (6, 147);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (7, 3);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (8, 99);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (9, 25);
INSERT INTO incidencia_developer (id_incidencia, id_developer) VALUES (10, 108);

-- migrate:down

DELETE FROM incidencia_developer;