-- migrate:up
CREATE TABLE documentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url_doc VARCHAR(200),
    tipo_doc VARCHAR(20) CHECK(tipo_doc IN ('incidencia', 'comentario')) -- Restricción de tipo
);
-- migrate:down
DROP TABLE documentos;
