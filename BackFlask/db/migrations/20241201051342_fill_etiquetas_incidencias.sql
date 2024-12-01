--migrate:up
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (1, 1); -- Incidencia A es Urgente
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (1, 2); -- Incidencia A también es un Bug
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (2, 3); -- Incidencia B es una Mejora
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (2, 4); -- Incidencia B está en Producción
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (3, 5); -- Incidencia C requiere Documentación
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (4, 1); -- Incidencia D es Urgente
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (4, 3); -- Incidencia D es una Mejora
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (5, 2); -- Incidencia E es un Bug
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (5, 4); -- Incidencia E está en Producción
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (6, 5); -- Incidencia F requiere Documentación
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (7, 1); -- Incidencia G es Urgente
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (8, 2); -- Incidencia H es un Bug
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (9, 3); -- Incidencia I es una Mejora
INSERT INTO etiquetas_incidencias (id_incidencia, id_etiqueta) VALUES (10, 4); -- Incidencia J está en Producción
--migrate:down
DELETE FROM  etiquetas_incidencias;