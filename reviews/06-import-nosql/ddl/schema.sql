CREATE DATABASE admin_nosql;

\c admin_nosql;

CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    codigo CHAR(3) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(250)
);

CREATE TABLE juegos (
    juego_id SERIAL PRIMARY KEY,
    codigo CHAR(3) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    precio NUMERIC(8, 2) NOT NULL,
    fecha_lanzamiento DATE,
    categoria_id INT NOT NULL
);

CREATE TABLE estudiantes(
    id SERIAL PRIMARY KEY,
    codigo CHAR(4),
    nombre VARCHAR(30),
    parciales INT[3]
);

CREATE TABLE images(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    archivo BYTEA
);