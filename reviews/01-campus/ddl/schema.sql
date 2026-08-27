
CREATE TABLE estudiantes(
    id SERIAL,
    nombre VARCHAR(60),
    genero CHAR(1),
    edad INT,
    promedio FLOAT,
    altura NUMERIC(3,2),
    fecha_ingreso DATE,z
    hora_ingreso TIME,
    fecha_hora_registro TIMESTAMP,
    duracion_tests INTERVAL,
    analisis_perfil TEXT,
    activo BOOLEAN
);
