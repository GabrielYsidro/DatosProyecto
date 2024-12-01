-- migrate:up
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia A', 'Descripción de la incidencia A', '2024-01-01 10:00:00', '2024-01-02 14:00:00', 1, 1, 1, 1, 2);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia B', 'Descripción de la incidencia B', '2024-02-15 09:00:00', '2024-02-16 15:30:00', 2, 2, 2, 2, 4);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia C', 'Descripción de la incidencia C', '2024-03-20 08:30:00', '2024-03-21 10:45:00', 3, 3, 3, 3, 6);

INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia D', 'Descripción de la incidencia D', '2024-04-10 11:00:00', '2024-04-11 13:30:00', 4, 4, 4, 4, 8);

-- Incidencia E
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia E', 'Descripción de la incidencia E', '2024-05-05 16:00:00', '2024-05-06 18:00:00', 5, 5, 1, 2, 10);

-- Incidencia F
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia F', 'Descripción de la incidencia F', '2024-06-01 12:00:00', '2024-06-02 14:00:00', 6, 6, 2, 3, 12);

-- Incidencia G
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia G', 'Descripción de la incidencia G', '2024-07-01 13:00:00', '2024-07-02 15:00:00', 7, 7, 3, 1, 14);

-- Incidencia H
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia H', 'Descripción de la incidencia H', '2024-08-01 14:00:00', '2024-08-02 16:00:00', 8, 8, 4, 2, 16);

-- Incidencia I
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia I', 'Descripción de la incidencia I', '2024-09-01 17:00:00', '2024-09-02 19:00:00', 9, 9, 1, 4, 18);

-- Incidencia J
INSERT INTO incidencias (resumen, descripcion, fecha_envio, fecha_actu, id_proyecto, id_departamento, id_estado, id_prioridad, id_documento)
VALUES ('Incidencia J', 'Descripción de la incidencia J', '2024-10-01 18:00:00', '2024-10-02 20:00:00', 10, 10, 2, 3, 20);


-- migrate:down
DELETE FROM  incidencias;