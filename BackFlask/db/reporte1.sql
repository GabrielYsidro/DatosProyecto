CREATE OR REPLACE FUNCTION calcular_promedio_resolucion(id_developer_buscar INTEGER)
RETURN FLOAT IS
  promedio FLOAT;
BEGIN
  -- Calcular el promedio de resolución en días
  SELECT AVG(i.fecha_actu - i.fecha_envio)
  INTO promedio
  FROM incidencias i
  INNER JOIN incidencia_developer idev ON i.id = idev.id_incidencia
  WHERE idev.id_developer = id_developer_buscar
    AND i.fecha_actu IS NOT NULL;

  RETURN COALESCE(promedio, 0); -- Retorna 0 si no hay registros
END calcular_promedio_resolucion;
/
CREATE OR REPLACE PROCEDURE llenar_reporte IS
  CURSOR developers_cursor IS
    SELECT dev.id, usr.nombre 
    FROM usuarios_developer dev
    INNER JOIN usuarios usr ON dev.id_usuario = usr.id;
  
  promedio_resolucion FLOAT;
BEGIN
  -- Iterar sobre cada developer
  FOR developer IN developers_cursor LOOP
    -- Calcular el promedio de resolución
    promedio_resolucion := calcular_promedio_resolucion(developer.id);
    
    -- Insertar en la tabla reportes
    INSERT INTO reportes (developer_name, average_resolution_time, created)
    VALUES (developer.nombre, promedio_resolucion, CURRENT_TIMESTAMP);
  END LOOP;

  COMMIT; -- Guardar los cambios
END llenar_reporte;
/


BEGIN
  llenar_reporte();
END;
/