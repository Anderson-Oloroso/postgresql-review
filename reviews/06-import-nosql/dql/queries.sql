-- Verificación de categorías cargadas mediante JSON
SELECT categoria_id, codigo, nombre
FROM categorias
ORDER BY categoria_id;

-- Verificación y conteo de juegos cargados mediante XML
SELECT COUNT(*) AS juegos_cargados FROM juegos;

SELECT codigo, titulo, precio
FROM juegos ORDER BY juego_id LIMIT 5;

-- Consulta con subconsulta agregada (promedio global)
SELECT codigo, titulo, precio
FROM juegos
WHERE precio > (
    SELECT AVG(precio) FROM juegos
);

-- Cruce INNER JOIN
SELECT j.titulo, c.nombre AS categoria, j.precio
FROM juegos AS j
INNER JOIN categorias c ON c.categoria_id = j.categoria_id
ORDER BY c.nombre, j.titulo;

-- Agrupamiento y conteo con LEFT JOIN
SELECT c.codigo, c.nombre, COUNT(j.juego_id) AS juegos
FROM categorias AS c
LEFT JOIN juegos as j ON j.categoria_id = c.categoria_id
GROUP BY c.categoria_id, c.codigo, c.nombre
ORDER BY c.categoria_id;

-- Consultas sobre arreglos nativos (ARRAY)
SELECT nombre, 
       parciales[1] AS parcial_1,
       cardinality(parciales) AS cantidad,
       95 = ANY(parciales) AS obtuvo_95
FROM estudiantes;

-- Verificación de longitud de archivos binarios (BYTEA)
SELECT nombre, octet_length(archivo) AS BINARY
FROM images;