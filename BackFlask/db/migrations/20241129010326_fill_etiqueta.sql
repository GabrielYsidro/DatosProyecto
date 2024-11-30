-- migrate:up
INSERT INTO etiquetas (id, nombre) VALUES (1, 'Urgente');
INSERT INTO etiquetas (id, nombre) VALUES (2, 'Bug');
INSERT INTO etiquetas (id, nombre) VALUES (3, 'Mejora');
INSERT INTO etiquetas (id, nombre) VALUES (4, 'Produccion');
INSERT INTO etiquetas (id, nombre) VALUES (5, 'Documentación');

-- migrate:down
DELETE FROM etiquetas;