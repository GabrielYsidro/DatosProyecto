-- migrate:up
INSERT INTO usuarios_analista (id_usuario) VALUES (100);
INSERT INTO usuarios_analista (id_usuario) VALUES (200);
INSERT INTO usuarios_analista (id_usuario) VALUES (300);

-- migrate:down

DELETE FROM usuarios_analista;