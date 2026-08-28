-- Poblar la tabla de prueba con duplicados
INSERT INTO datos_fake (codigo, nombre, apellido, edad) VALUES
('001', 'Patricia', 'Fernandez', 40),
('002', 'Armando', 'Benedetti', 38),
('001', 'Patricia', 'Fernandez', 40),
('003', 'Kevin', 'Garcia', 42),
('004', 'Jhon', 'Cuevas', 23),
('005', 'Luna', 'Herrera', 40),
('002', 'Armando', 'Benedetti', 38),
('001', 'Patricia', 'Fernandez', 40),
('002', 'Armando', 'Benedetti', 38),
('001', 'Patricia', 'Fernandez', 40);

-- Eliminar duplicados manteniendo únicamente la primera ocurrencia de cada código
WITH duplicados AS (
    SELECT id, ROW_NUMBER() OVER (PARTITION BY codigo ORDER BY id) AS row_number
    FROM datos_fake
)
DELETE FROM datos_fake 
WHERE id IN (SELECT id 
    FROM duplicados 
    WHERE row_number > 1)
RETURNING id, codigo, nombre, apellido;