-- ===========================================
-- SELECT
-- ===========================================

-- 1. Obtener el nombre, edad y promedio de todos los estudiantes que se encuentren activos.
SELECT nombre, edad, promedio 
FROM estudiantes 
WHERE activo = TRUE;

-- 2. Listar todos los estudiantes del género femenino que tengan un promedio mayor o igual a 4.5.
SELECT id, nombre, edad, promedio, altura, duracion_tests, analisis_perfil, activo
FROM estudiantes 
WHERE genero = 'F' AND promedio >= 4.5;

-- 3. Consultar los estudiantes ingresados en el año 2024, ordenados de forma descendente por su fecha de ingreso.
SELECT * FROM estudiantes
WHERE EXTRACT(YEAR FROM fecha_ingreso) = 2024
ORDER BY fecha_ingreso DESC;

-- 4. Obtener el promedio de edad y el promedio general de calificaciones de todos los estudiantes registrados.
SELECT ROUND(AVG(edad)::NUMERIC, 2) AS Promedio_Edad, ROUND(AVG(promedio)::NUMERIC, 2) AS Promedio_General
FROM estudiantes;

-- 5. Contar cuántos estudiantes hay registrados por cada género.
SELECT genero, COUNT(*) AS cantidad_estudiantes
FROM estudiantes
GROUP BY genero;

-- 6. Listar los 5 estudiantes con los promedios más altos de toda la tabla.
SELECT id,  nombre, genero, edad, promedio, duracion_tests, analisis_perfil
FROM estudiantes
ORDER BY promedio DESC
LIMIT 5;

-- 7. Seleccionar los estudiantes cuya duración de tests haya sido mayor a 2 horas y media.
SELECT id,  nombre, genero, edad, promedio, duracion_tests, analisis_perfil
FROM estudiantes
WHERE duracion_tests > '02:30:00'
ORDER BY duracion_tests ASC;

-- 8. Buscar a los estudiantes cuyo análisis de perfil contenga la palabra "bases de datos" o "algoritmos".
SELECT id,  nombre, genero, edad, promedio, duracion_tests, analisis_perfil
FROM estudiantes
WHERE analisis_perfil LIKE '%bases de datos%' OR analisis_perfil LIKE '%algoritmos%'
ORDER BY id ASC;

-- 9. Calcular la altura máxima y mínima registrada entre los estudiantes hombres.
SELECT MAX(altura) AS altura_maxima, MIN(altura) AS altura_minima
FROM estudiantes
WHERE genero = 'M';

-- 10. Mostrar el nombre, fecha e hora exacta de registro de los estudiantes que ingresaron antes de las 09:00:00 AM.
SELECT nombre, fecha_ingreso, hora_ingreso 
FROM estudiantes
WHERE hora_ingreso < '09:00:00'
ORDER BY hora_ingreso DESC;
-- =====================================
-- UPDATE
-- =====================================
-- 1. Cambiar el estado a inactivo para el estudiante con id 6.
UPDATE estudiantes SET activo = False WHERE id = 6;

-- 2. Incrementar en 0.2 el promedio de todos los estudiantes que tengan un promedio menor a 3.0.
UPDATE estudiantes SET promedio = promedio + 0.2 WHERE promedio < 3.0;

-- 3. Actualizar la hora de ingreso a 08:00:00 para todos los estudiantes que ingresaron el día 2024-02-01.
UPDATE estudiantes SET hora_ingreso = '08:00:00' WHERE fecha_ingreso = '2024-02-01';

-- 4. Modificar el análisis de perfil del estudiante con id 15 para agregar la anotación: "Graduado con honores académicos.".
UPDATE estudiantes SET analisis_perfil = 'Graduado con honores académicos.' WHERE id = 15;

-- 5. Cambiar el género a F y actualizar la altura a 1.65 para un estudiante específico cuyo ID sea 20.
UPDATE estudiantes SET genero = 'F', altura = 1.65 WHERE id = 20;
-- 6. Desactivar a todos los estudiantes registrados antes del año 2022 que tengan un promedio inferior a 3.5.
UPDATE estudiantes SET activo = False WHERE fecha_ingreso < '2022-01-01' AND promedio < 3.5;

-- 7. Ajustar la duración de los tests a 2 horas para todos los estudiantes que actualmente tengan registrada una duración inferior a 1 hora.
UPDATE estudiantes SET duracion_tests = '02:00:00' WHERE duracion_tests < '01:00:00';

-- 8. Aumentar la edad en 1 año a todos los estudiantes que ingresaron en el año 2021.
UPDATE estudiantes SET edad = edad + 1 WHERE fecha_ingreso >= '2021-01-01' AND fecha_ingreso < '2022-01-01';

-- 9. Limpiar o establecer como NULL el campo analisis_perfil para los estudiantes inactivos.
UPDATE estudiantes SET analisis_perfil = NULL WHERE activo = false;

-- 10. Actualizar el promedio a 5.0 para el estudiante que tenga la fecha de registro más antigua de la base de datos.
UPDATE estudiantes SET promedio = 5.0 WHERE fecha_hora_registro = (SELECT MIN(fecha_hora_registro) FROM estudiantes);

-- ======================================
-- DELETE
-- ======================================
-- 1. Eliminar el registro del estudiante con id 34.
DELETE FROM estudiantes WHERE id = 34;

-- 2. Borrar todos los estudiantes que estén inactivos.
DELETE FROM estudiantes WHERE activo = false;

-- 3. Eliminar a los estudiantes cuyo promedio sea estrictamente menor a 2.5.
DELETE FROM estudiantes WHERE promedio < 2.5;

-- 4. Borrar las filas de estudiantes cuya fecha de ingreso sea anterior al '2021-01-01'.
DELETE FROM estudiantes WHERE fecha_ingreso < '2021-01-01';

-- 5. Eliminar a los estudiantes del género masculino que tengan una altura inferior a 1.60 m.
DELETE FROM estudiantes WHERE genero = 'M' AND altura < 1.60;

-- 6. Borrar los registros de estudiantes ingresados en el año 2024 que se encuentren inactivos.
DELETE FROM estudiantes WHERE fecha_ingreso >= '2024-01-01' AND fecha_ingreso < '2025-01-01' AND activo = false;

-- 7. Eliminar a los estudiantes cuya duración de tests sea menor a 45 minutos.
DELETE FROM estudiantes WHERE duracion_tests < '00:45:00';

-- 8. Borrar a todos los estudiantes cuyo nombre comience con la letra 'E'.
DELETE FROM estudiantes WHERE nombre LIKE 'E%';

-- 9. Eliminar a los estudiantes activos que ingresaron antes del año 2023 y cuyo promedio sea menor a 3.5.
DELETE FROM estudiantes WHERE activo = true AND fecha_ingreso < '2023-01-01' AND promedio < 3.5;

-- 10. Vaciar completamente la tabla estudiantes eliminando todos sus registros.
DELETE FROM estudiantes;