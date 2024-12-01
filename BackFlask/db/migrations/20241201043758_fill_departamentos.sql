-- migrate:up
INSERT INTO departamentos (id, nombre) VALUES (1, 'Recursos Humanos');
INSERT INTO departamentos (id, nombre) VALUES (2, 'Finanzas');
INSERT INTO departamentos (id, nombre) VALUES (3, 'Marketing');
INSERT INTO departamentos (id, nombre) VALUES (4, 'Tecnologia');
INSERT INTO departamentos (id, nombre) VALUES (5, 'Ventas');
INSERT INTO departamentos (id, nombre) VALUES (6, 'Operaciones');
INSERT INTO departamentos (id, nombre) VALUES (7, 'Logistica');
INSERT INTO departamentos (id, nombre) VALUES (8, 'Compras');
INSERT INTO departamentos (id, nombre) VALUES (9, 'Atencion al Cliente');
INSERT INTO departamentos (id, nombre) VALUES (10, 'Produccion');

-- migrate:down
DELETE FROM departamentos;