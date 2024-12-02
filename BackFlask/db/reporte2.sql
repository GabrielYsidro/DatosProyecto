CREATE OR REPLACE PROCEDURE llenar_reporte_estado IS
  v_estado_nombre VARCHAR2(50);
  v_prioridad_nombre VARCHAR2(50);
  v_total_incidencias NUMBER;
BEGIN
  -- Loop por cada estado
  FOR estado IN (SELECT * FROM estados) LOOP
    -- Loop por cada prioridad
    FOR prioridad IN (SELECT * FROM prioridades) LOOP
      -- Contamos las incidencias abiertas por estado y prioridad
      SELECT COUNT(*)
      INTO v_total_incidencias
      FROM incidencias i
      INNER JOIN estados e ON i.id_estado = e.id
      INNER JOIN prioridades p ON i.id_prioridad = p.id
      WHERE e.nombre = estado.nombre
        AND p.nombre = prioridad.nombre
        AND i.fecha_actu IS NULL; -- Solo incidencias abiertas

      -- Insertar el resultado en la tabla de reportes
      INSERT INTO reporte_estado_prioridad (estado_nombre, prioridad_nombre, total_incidencias, created)
      VALUES (estado.nombre, prioridad.nombre, v_total_incidencias, CURRENT_TIMESTAMP);
    END LOOP;
  END LOOP;
END;
/

-- Llamar al procedimiento para llenar el reporte
BEGIN
  llenar_reporte_estado;
END;
/
