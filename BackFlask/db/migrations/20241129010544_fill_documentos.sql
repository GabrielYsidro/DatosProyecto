-- migrate:up
INSERT INTO documentos (id, url_doc) VALUES (1, 'https://example.com/7odzyqkzaq.docx');
INSERT INTO documentos (id, url_doc) VALUES (2, 'https://example.com/khdpmekfee.jpg');
INSERT INTO documentos (id, url_doc) VALUES (3, 'https://example.com/qwb5gctl3h.xlsx');
INSERT INTO documentos (id, url_doc) VALUES (4, 'https://example.com/zx33gvv285.jpg');
INSERT INTO documentos (id, url_doc) VALUES (5, 'https://example.com/b70ka8mxpi.xlsx');
INSERT INTO documentos (id, url_doc) VALUES (6, 'https://example.com/q96v61832v.pdf');
INSERT INTO documentos (id, url_doc) VALUES (7, 'https://example.com/7jpahrw3j4.jpg');
INSERT INTO documentos (id, url_doc) VALUES (8, 'https://example.com/4z1wys9r9w.xlsx');
INSERT INTO documentos (id, url_doc) VALUES (9, 'https://example.com/thib53o96s.jpg');
INSERT INTO documentos (id, url_doc) VALUES (10, 'https://example.com/secwtg4hy8.xlsx');

-- migrate:down
DELETE FROM documentos;