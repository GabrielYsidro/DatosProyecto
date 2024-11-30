-- migrate:up
CREATE TABLE documentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url_doc VARCHAR(200),
    tipo_doc VARCHAR(20)
    );
-- migrate:down
DROP TABLE documentos;
