
DELETE FROM usuarios_analista;
DELETE FROM usuarios_cliente;
DELETE FROM usuarios_developer;
DELETE FROM etiquetas_incidencias;
DELETE FROM incidencia_analista;
DELETE FROM incidencia_cliente;
DELETE FROM incidencia_developer;
DELETE FROM documento_comentarios;
DELETE FROM developer_departamentos;
DELETE FROM departamentos;
DELETE FROM departamentos_proyecto;
DELETE FROM documentos;
DELETE FROM estados;
DELETE FROM etiquetas;
DELETE FROM incidencias;
DELETE FROM prioridades;
DELETE FROM proyectos;
DELETE FROM usuarios;

INSERT INTO proyectos (nombre, fecha_inicio) VALUES ('Desarrollo de Software', DATE('now'));
