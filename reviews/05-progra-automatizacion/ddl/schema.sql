CREATE DATABASE store_tech;

\c store_tech;

CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(120),
    precio NUMERIC(8, 2),
    stock INT
);

CREATE TABLE Ventas (
    id SERIAL PRIMARY KEY,
    producto_id INT NOT NULL,
    cantidad INT,
    fecha_venta DATE
);

CREATE TABLE ventas_vendedores (
    id SERIAL PRIMARY KEY,
    fecha DATE,
    vendedor VARCHAR(50),
    monto NUMERIC(8, 2)
);

CREATE TABLE inventario (
  id SERIAL PRIMARY KEY,
  producto VARCHAR(150),
  cantidad INT,
  precio NUMERIC(6, 2)
);

CREATE TABLE clientes_2023 (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE clientes_2024 (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla de auditoría para registro de eventos en Triggers
CREATE TABLE auditoria (
    id SERIAL PRIMARY KEY,
    tabla_modificada VARCHAR(150),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cambios TEXT
);