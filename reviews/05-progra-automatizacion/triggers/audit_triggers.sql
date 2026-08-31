-- 1. Función Trigger que evalúa las variables OLD y NEW
CREATE OR REPLACE FUNCTION registrar_cambio()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$
DECLARE 
    v_resumen_cambio TEXT := '';
BEGIN
    IF OLD.precio IS DISTINCT FROM NEW.precio THEN
        v_resumen_cambio := v_resumen_cambio || FORMAT('Precio %s -> %s; ', OLD.precio, NEW.precio);
    END IF;
    
    IF OLD.cantidad IS DISTINCT FROM NEW.cantidad THEN
        v_resumen_cambio := v_resumen_cambio || FORMAT('Cantidad %s -> %s; ', OLD.cantidad, NEW.cantidad);
    END IF;

    IF v_resumen_cambio <> '' THEN
        INSERT INTO auditoria(tabla_modificada, fecha, cambios)
        VALUES ('inventario', CURRENT_TIMESTAMP, v_resumen_cambio);   
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER cambio_inventario
AFTER UPDATE ON inventario
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio();

-- Pruebas de disparador
UPDATE inventario SET precio = 60.00 WHERE id = 1;
UPDATE inventario SET cantidad = 100 WHERE id = 1;

SELECT * FROM auditoria;

-- Eliminación limpia del trigger y su función (descomentar si se requiere)
-- DROP TRIGGER cambio_inventario ON inventario;
-- DROP FUNCTION registrar_cambio();