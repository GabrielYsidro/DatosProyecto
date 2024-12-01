-- migrate:up
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (1, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (2, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (3, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (3, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (3, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (3, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (4, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (4, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (4, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (5, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (5, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (5, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (5, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (5, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (6, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (6, 3);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (6, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (7, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (8, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (9, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (9, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (10, 1);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (10, 5);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (10, 2);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (10, 4);
INSERT INTO developer_departamentos (id_developer, id_departamento) VALUES (10, 3);

-- migrate:down
DELETE FROM developer_departamentos;
