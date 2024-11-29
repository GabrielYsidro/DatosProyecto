-- migrate:up
-- Insertar 20 registros en la tabla `usuarios_developer`
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV001', 1);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV002', 2);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV003', 3);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV004', 4);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV005', 5);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV006', 6);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV007', 7);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV008', 8);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV009', 9);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV010', 10);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV011', 11);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV012', 12);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV013', 13);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV014', 14);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV015', 15);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV016', 16);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV017', 17);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV018', 18);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV019', 19);
INSERT INTO usuarios_developer (codigo, id_usuario) VALUES ('DEV020', 20);

-- migrate:down
-- Borrar la tabla 'usuarios_developer'
DROP TABLE usuarios_developer;
