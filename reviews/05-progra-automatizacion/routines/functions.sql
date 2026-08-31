-- Función para calcular el valor total del stock de un producto específico
CREATE FUNCTION valor_total_producto(p_producto_id INT)
RETURNS NUMERIC(8,2) 
LANGUAGE plpgsql 
AS $$
DECLARE v_valor_total NUMERIC(8,2);
BEGIN
    SELECT precio * cantidad INTO v_valor_total
    FROM inventario 
    WHERE id = p_producto_id;

    RETURN v_valor_total;
END;
$$;

-- Ejemplo de uso de la función en un SELECT
SELECT id, producto, valor_total_producto(id) AS total_monetario 
FROM inventario;

-- =================== REVIEW =======================
-- En el porcentaje, al entrar en la funcion ya debe estar convertida a decimal
-- si el descuento es 15%, debe entrar como 0.15
CREATE FUNCTION fn_aplicar_descuento_producto(p_id INT, p_descuento DECIMAL(8,2))
RETURNS NUMERIC(8,2)
LANGUAGE plpgsql 
AS $$
DECLARE n_precio DECIMAL (8,2);
BEGIN 
    UPDATE inventario SET precio = precio - (precio * p_descuento) WHERE id = p_id
    RETURNING precio INTO n_precio; 
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No existe un producto con id = %', p_id;
    END IF;
    RETURN n_precio;
END;
$$;

SELECT fn_aplicar_descuento_producto(1, 0.1);






