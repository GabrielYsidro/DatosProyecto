-- migrate:up
CREATE TABLE documentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url_doc VARCHAR(200),
    tipo VARCHAR(30)
    );
-- migrate:down
DROP TABLE documentos;