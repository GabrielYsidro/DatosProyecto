CREATE OR REPLACE TRIGGER limitar_departamentos
BEFORE INSERT ON departamentos
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  -- Contar el número actual de departamentos
  SELECT COUNT(*) INTO v_count FROM departamentos;

  -- Si ya existen 10 departamentos, se lanza un error
  IF v_count >= 10 THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se pueden agregar más de 10 departamentos.');
  END IF;
END;
