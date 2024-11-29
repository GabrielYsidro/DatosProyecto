-- migrate:up
-- Insertar 20 registros en la tabla `documento_comentarios`
INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (1, 1);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (2, 2);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (3, 3);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (4, 4);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (5, 5);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (6, 6);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (7, 7);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (8, 8);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (9, 9);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (10, 10);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (11, 1);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (12, 2);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (13, 3);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (14, 4);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (15, 5);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (16, 6);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (17, 7);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (18, 8);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (19, 9);

INSERT INTO documento_comentarios (id_documento, id_comentario)
VALUES (20, 10);

-- migrate:down
-- Borrar la tabla 'documento_comentarios'
DROP TABLE documento_comentarios;
