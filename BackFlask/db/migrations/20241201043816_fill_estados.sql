-- migrate:up
INSERT INTO estados (id, nombre, url_imagen) VALUES (1, 'Activo', 'https://example.com/activo.jpg');
INSERT INTO estados (id, nombre, url_imagen) VALUES (2, 'Inactivo', 'https://example.com/inactivo.jpg');
INSERT INTO estados (id, nombre, url_imagen) VALUES (3, 'Pendiente', 'https://example.com/pendiente.jpg');
INSERT INTO estados (id, nombre, url_imagen) VALUES (4, 'Finalizado', 'https://example.com/finalizado.jpg');

-- migrate:down
DELETE FROM  estados;