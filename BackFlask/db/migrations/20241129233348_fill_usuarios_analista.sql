-- migrate:up
-- Insertar 20 registros en la tabla `usuarios_analista`
INSERT INTO usuarios_analista (id_usuario) VALUES (1);
INSERT INTO usuarios_analista (id_usuario) VALUES (2);
INSERT INTO usuarios_analista (id_usuario) VALUES (3);
INSERT INTO usuarios_analista (id_usuario) VALUES (4);
INSERT INTO usuarios_analista (id_usuario) VALUES (5);
INSERT INTO usuarios_analista (id_usuario) VALUES (6);
INSERT INTO usuarios_analista (id_usuario) VALUES (7);
INSERT INTO usuarios_analista (id_usuario) VALUES (8);
INSERT INTO usuarios_analista (id_usuario) VALUES (9);
INSERT INTO usuarios_analista (id_usuario) VALUES (10);
INSERT INTO usuarios_analista (id_usuario) VALUES (11);
INSERT INTO usuarios_analista (id_usuario) VALUES (12);
INSERT INTO usuarios_analista (id_usuario) VALUES (13);
INSERT INTO usuarios_analista (id_usuario) VALUES (14);
INSERT INTO usuarios_analista (id_usuario) VALUES (15);
INSERT INTO usuarios_analista (id_usuario) VALUES (16);
INSERT INTO usuarios_analista (id_usuario) VALUES (17);
INSERT INTO usuarios_analista (id_usuario) VALUES (18);
INSERT INTO usuarios_analista (id_usuario) VALUES (19);
INSERT INTO usuarios_analista (id_usuario) VALUES (20);

-- migrate:down
-- Borrar la tabla 'usuarios_analista'
DROP TABLE usuarios_analista;
