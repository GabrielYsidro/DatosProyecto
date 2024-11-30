-- migrate:up
-- migrate:up
INSERT INTO prioridades (id, nombre) VALUES (1, 'Alta');
INSERT INTO prioridades (id, nombre) VALUES (2, 'Media');
INSERT INTO prioridades (id, nombre) VALUES (3, 'Baja');
INSERT INTO prioridades (id, nombre) VALUES (4, 'Crítica');

-- migrate:down
DELETE FROM prioridades;