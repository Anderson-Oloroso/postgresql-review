-- Procedimiento almacenado para reabastecimiento/ajuste de inventario
CREATE PROCEDURE actualizar_inventario(v_producto_id INT, v_cantidad INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE inventario 
    SET cantidad = cantidad + v_cantidad
    WHERE id = v_producto_id;
END;
$$;

-- Ejemplo de ejecución
CALL actualizar_inventario(1, 5);

-- En esta procedimiento los el porcentaje ya tiene que ingresar en decimal
-- si era 10%, ingresa como 0.1
CREATE PROCEDURE sp_ajustar_precios_bajo_stock(v_stock INT, v_porcentaje DECIMAL(8,2))
LANGUAGE plpgsql
AS $$ 
BEGIN 
    UPDATE inventario SET precio = precio + (precio * v_porcentaje) 
    WHERE cantidad < v_stock;
END;
$$;

CALL sp_ajustar_precios_bajo_stock(10, 0.1);
