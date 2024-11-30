-- migrate:up
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (1, 1);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (3, 2);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (5, 3);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (7, 4);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (9, 5);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (11, 6);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (13, 7);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (15, 8);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (17, 9);
INSERT INTO documento_comentarios (id_documento, id_comentario) VALUES (19, 10);
-- migrate:down

DROP TABLE documento_comentarios;
