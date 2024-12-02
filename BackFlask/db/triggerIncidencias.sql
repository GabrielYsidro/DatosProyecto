CREATE OR REPLACE TRIGGER verificar_max_developer
BEFORE INSERT ON incidencia_developer
FOR EACH ROW
DECLARE
  total_incidencias INTEGER;
BEGIN
  -- Verifica cuántas incidencias tiene el desarrollador asignadas
  SELECT COUNT(*) INTO total_incidencias
  FROM incidencia_developer
  WHERE id_developer = :NEW.id_developer;

  -- Si tiene 5 o más incidencias, no se le puede asignar una más
  IF total_incidencias >= 5 THEN
    RAISE_APPLICATION_ERROR(-20002, 'El desarrollador ya tiene 5 incidencias asignadas.');
  END IF;
END;
/
