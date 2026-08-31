-- Actualizar correos en customers basándonos en la tabla auxiliar customers_add
UPDATE customers C 
SET email = CA.email
FROM customers_add CA
WHERE C.id = CA.id;

-- Actualizar el correo del cliente con ID 1 y retornar sus datos actualizados
UPDATE customers 
SET email = 'carlos.gomez.dev@gmail.com' 
WHERE id = 1
RETURNING id, first_name, last_name, email;

-- Bloque anónimo PL/pgSQL para capturar un valor actualizado en una variable
DO $$
DECLARE
    v_updated_email VARCHAR(100);
    v_customer_name VARCHAR(50);
BEGIN
    UPDATE customers 
    SET email = 'clark.kent.superman@gmail.com'
    WHERE id = 12
    RETURNING email, first_name INTO v_updated_email, v_customer_name;

    RAISE NOTICE 'El cliente % fue actualizado con el nuevo correo: %', v_customer_name, v_updated_email;
END $$;

-- RAISE NOTICE sirve para mostrar un mensaje informativo en consola.

