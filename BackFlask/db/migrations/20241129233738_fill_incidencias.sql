-- migrate:up
-- Insertar 20 registros en la tabla `incidencias`
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia A', 'Descripción de la incidencia A', '2024-01-01 10:00:00', '2024-01-02 14:00:00', 1, 1, 1, 1, 1);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia B', 'Descripción de la incidencia B', '2024-02-15 09:00:00', '2024-02-16 15:30:00', 2, 2, 2, 2, 2);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia C', 'Descripción de la incidencia C', '2024-03-20 08:30:00', '2024-03-21 10:45:00', 3, 3, 3, 3, 3);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia D', 'Descripción de la incidencia D', '2024-04-10 11:00:00', '2024-04-11 13:30:00', 4, 4, 4, 4, 4);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia E', 'Descripción de la incidencia E', '2024-05-25 14:30:00', '2024-05-26 16:00:00', 5, 5, 1, 5, 5);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia F', 'Descripción de la incidencia F', '2024-06-05 15:00:00', '2024-06-06 17:00:00', 6, 6, 2, 1, 6);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia G', 'Descripción de la incidencia G', '2024-07-17 12:00:00', '2024-07-18 18:00:00', 7, 7, 3, 2, 7);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia H', 'Descripción de la incidencia H', '2024-08-30 13:00:00', '2024-08-31 19:00:00', 8, 8, 4, 3, 8);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia I', 'Descripción de la incidencia I', '2024-09-14 16:00:00', '2024-09-15 20:00:00', 9, 9, 1, 4, 9);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia J', 'Descripción de la incidencia J', '2024-10-02 17:30:00', '2024-10-03 21:00:00', 10, 10, 2, 5, 10);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia K', 'Descripción de la incidencia K', '2024-11-06 09:15:00', '2024-11-07 11:45:00', 11, 11, 3, 1, 11);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia L', 'Descripción de la incidencia L', '2024-12-12 10:30:00', '2024-12-13 14:00:00', 12, 12, 4, 2, 12);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia M', 'Descripción de la incidencia M', '2025-01-09 08:00:00', '2025-01-10 09:30:00', 13, 13, 1, 3, 13);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia N', 'Descripción de la incidencia N', '2025-02-20 14:00:00', '2025-02-21 15:30:00', 14, 14, 2, 4, 14);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia O', 'Descripción de la incidencia O', '2025-03-30 11:00:00', '2025-03-31 12:30:00', 15, 15, 3, 5, 15);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia P', 'Descripción de la incidencia P', '2025-04-25 13:30:00', '2025-04-26 16:30:00', 16, 16, 4, 1, 16);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia Q', 'Descripción de la incidencia Q', '2025-05-15 09:00:00', '2025-05-16 10:45:00', 17, 17, 1, 2, 17);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento) 
VALUES ('Incidencia R', 'Descripción de la incidencia R', '2025-06-02 15:00:00', '2025-06-03 18:00:00', 18, 18, 2, 3, 18);

-- migrate:down
-- Borrar la tabla 'incidencias'
DROP TABLE incidencias;
