-- Agregar la restricción de unicidad para el correo electrónico
ALTER TABLE customers 
ADD CONSTRAINT u_email UNIQUE (email);

-- Caso A: Inserción normal de un nuevo cliente 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Clark', 'Kent', 'ckent@gmail.com');

-- Caso B: Inserción de un cliente con un correo que ya existe -- Do nothing lo va a ignorar
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Carlos', 'Gomez', 'cgomez@gmail.com')
ON CONFLICT (email) DO NOTHING;

-- Caso C: Inserción múltiple combinando correos existentes y nuevos
INSERT INTO customers (first_name, last_name, email) 
VALUES 
    ('Lana', 'Lang', 'llang@gmail.com'),
    ('Jhon', 'Kent', 'jkent@gmail.com'),
    ('Maria', 'Lopez', 'mlopez@hotmail.com') -- Se omitira este correo
ON CONFLICT (email) DO NOTHING;

-- 1. Poblar productos
INSERT INTO productos (nombre, stock) VALUES
('Teclado Mecánico Redragon', 15),
('Mouse Inalámbrico Logitech', 0),    
('Monitor Gamer 24" Dell', 0),         
('Alfombrilla XL RGB', 0);             

-- 2. Poblar ventas para vincular con el producto id 1 y 3
INSERT INTO ventas (producto_id, cantidad) VALUES
(1, 2),
(3, 1);

INSERT INTO customers (first_name, last_name, email) VALUES
('Carlos', 'Mendoza', 'cmendoza@devmail.com'),
('Elena', 'Ríos', 'erios@devmail.com'),
('Mateo', 'Salazar', 'msalazar@devmail.com'),
('Sofia', 'Vásquez', 'svasquez@devmail.com'),
('Alejandro', 'Gómez', 'agomez@devmail.com');

INSERT INTO customers_add (id, email) VALUES
(1, 'carlos.mendoza@enterprise.io'),
(2, 'elena.rios@enterprise.io'),
(3, 'mateo.salazar@enterprise.io');

INSERT INTO productos (nombre, stock) VALUES
('Teclado Mecánico RGB', 15),
('Mouse Inalámbrico', 0),
('Soporte Monitores Doble', 0),
('Hub USB-C 8 en 1', 8),
('Alfombrilla XL', 0),
('Lámpara de Escritorio LED', 22);

INSERT INTO ventas (producto_id, cantidad) VALUES
(1, 3),
(2, 1),
(6, 5),
(1, 1);

INSERT INTO datos_fake (codigo, nombre, apellido, edad) VALUES
('USR-001', 'Patricia', 'Fernández', 40),
('USR-002', 'Armando', 'Mendoza', 38),
('USR-001', 'Patricia', 'Fernández', 40),
('USR-003', 'Kevin', 'García', 42),
('USR-004', 'Jhon', 'Cuevas', 23),
('USR-002', 'Armando', 'Mendoza', 38),
('USR-005', 'Luna', 'Herrera', 29),
('USR-001', 'Patricia', 'Fernández', 40),
('USR-004', 'Jhon', 'Cuevas', 23),
('USR-006', 'Beatriz', 'Pinzón', 31);
