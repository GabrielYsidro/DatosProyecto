-- migrate:up
CREATE TABLE documento_comentarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_documento INTEGER NOT NULL,
    id_comentario INTEGER NOT NULL,
    FOREIGN KEY (id_documento) REFERENCES documentos(id),  
    FOREIGN KEY (id_comentario) REFERENCES comentarios(id)
);

-- migrate:down
DROP TABLE documento_comentarios;
