-- migrate:up
-- Insertar 20 registros en la tabla `proyectos`
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto A', '2024-01-01', 1);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto B', '2024-02-15', 2);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto C', '2024-03-20', 3);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto D', '2024-04-10', 4);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto E', '2024-05-25', 5);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto F', '2024-06-05', 6);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto G', '2024-07-17', 7);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto H', '2024-08-30', 8);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto I', '2024-09-14', 9);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto J', '2024-10-02', 10);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto K', '2024-11-06', 11);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto L', '2024-12-12', 12);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto M', '2025-01-09', 13);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto N', '2025-02-20', 14);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto O', '2025-03-30', 15);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto P', '2025-04-25', 16);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto Q', '2025-05-15', 17);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto R', '2025-06-02', 18);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto S', '2025-07-12', 19);
INSERT INTO proyectos (nombre, fecha_inicio, id_cliente) VALUES ('Proyecto T', '2025-08-25', 20);

-- migrate:down
-- Borrar la tabla 'proyectos'
DROP TABLE proyectos;
