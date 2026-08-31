-- ================================
-- CONSULTAS
-- ================================
-- 1. **Obtener el título, fecha de publicación y precio de todos los libros publicados después del año 2000, ordenados del más reciente al más antiguo.**
SELECT titulo, fecha_publicacion, precio 
FROM libros 
WHERE fecha_publicacion > '2000-12-31' 
ORDER BY fecha_publicacion ASC;

-- 2. **Listar los nombres completos (nombre y apellido en una sola columna) y la nacionalidad de todos los autores cuya nacionalidad sea 'Española' o 'Argentina'.**
SELECT CONCAT(nombre, ' ', apellido) AS Autor, nacionalidad 
FROM autores 
WHERE nacionalidad = 'Española' OR nacionalidad = 'Argentina' 
ORDER BY nombre DESC;

-- 3. **Consultar todos los libros cuyo precio esté entre $15.00 y $20.00 inclusive.**
SELECT * FROM libros 
WHERE precio BETWEEN 15.00 AND 20.00 
ORDER BY precio DESC;

-- 4. **Buscar todos los libros cuyo título contenga la palabra "amor" (sin importar si está en mayúsculas o minúsculas).**
SELECT * FROM libros 
WHERE titulo LIKE '%amor%' 
ORDER BY libro_id ASC;

-- 5. **Mostrar los 5 libros más costosos de la base de datos con su título y precio.**
SELECT titulo, precio 
FROM libros 
ORDER BY precio DESC
LIMIT 5;

-- 6. **Mostrar el título del libro, el precio y el nombre completo del autor al que pertenece cada libro.**
SELECT l.titulo, l.precio, CONCAT(a.nombre, ' ', a.apellido) AS Autor
FROM libros l INNER JOIN autores a ON l.autor_id = a.autor_id;

-- 7. **Calcular la cantidad total de libros que ha escrito cada autor. Mostrar el nombre completo del autor y el total de libros, ordenados de mayor a menor.**
SELECT CONCAT(a.nombre, ' ', a.apellido) AS Autor, COUNT(l.*)
FROM libros l INNER JOIN autores a ON l.autor_id = a.autor_id
GROUP BY a.nombre, a.apellido;

-- 8. **Obtener el precio promedio, el precio mínimo y el precio máximo de los libros publicados por cada autor.**
SELECT CONCAT(a.nombre, ' ', a.apellido) AS Autor, MIN(l.precio) AS Precio_minimo, MAX(l.precio) AS Precio_maximo, ROUND(AVG(l.precio), 2) AS Promedio
FROM libros l INNER JOIN autores a ON l.autor_id = a.autor_id
GROUP BY a.nombre, a.apellido;

-- 9. **Listar los autores que tienen un promedio de precio en sus libros superior a $20.00.**
SELECT CONCAT(a.nombre, ' ', a.apellido) AS Autor, ROUND(AVG(l.precio), 2) AS Promedio
FROM libros l INNER JOIN autores a ON l.autor_id = a.autor_id
GROUP BY a.nombre, a.apellido
HAVING ROUND(AVG(l.precio), 2) > 20.00;

-- 10. **Contar cuántos libros se han publicado por cada nacionalidad de los autores.**
SELECT a.nacionalidad, COUNT(l.*)
FROM libros l INNER JOIN autores a ON l.autor_id = a.autor_id
GROUP BY a.nacionalidad;