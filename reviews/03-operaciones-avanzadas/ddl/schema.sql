CREATE DATABASE campus_store;

\c campus_store;

-- Tabla principal de clientes
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(100)
);

-- Tabla auxiliar para actualización cruzada
CREATE TABLE customers_add (
    id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(100)
);

-- Tablas para práctica de eliminación condicional
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    stock INT NOT NULL DEFAULT 0
);

CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    producto_id INT REFERENCES productos(id),
    cantidad INT NOT NULL,
    fecha_venta DATE DEFAULT CURRENT_DATE
);

-- Tabla para práctica de duplicados con CTE
CREATE TABLE datos_fake (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(30),
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    edad INT
);