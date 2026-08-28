-- Consultar tabla principal de clientes
SELECT * FROM customers ORDER BY id;

-- Verificar la secuencia actual de id
SELECT currval(pg_get_serial_sequence('customers', 'id'));

-- Verificar productos restantes tras la limpieza
SELECT * FROM productos;

-- Consultar datos fake sin duplicados
SELECT * FROM datos_fake ORDER BY codigo;