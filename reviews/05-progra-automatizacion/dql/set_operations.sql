-- 1. UNION: Combina resultados de 2023 y 2024 eliminando duplicados
SELECT cliente_id, nombre, 2023 AS anio FROM clientes_2023 
UNION 
SELECT cliente_id, nombre, 2024 AS anio FROM clientes_2024
ORDER BY cliente_id ASC;

-- 2. UNION ALL: Une todos los registros de ambas tablas, incluyendo duplicados
SELECT cliente_id, nombre, 2023 AS anio FROM clientes_2023 
UNION ALL 
SELECT cliente_id, nombre, 2024 AS anio FROM clientes_2024
ORDER BY cliente_id ASC;

-- 3. INTERSECT: Obtiene únicamente los clientes que compraron en AMBOS años
SELECT cliente_id, nombre FROM clientes_2023 
INTERSECT
SELECT cliente_id, nombre FROM clientes_2024
ORDER BY cliente_id ASC;

-- 4. EXCEPT: Clientes que compraron en 2024 pero NO compraron en 2023
SELECT cliente_id, nombre FROM clientes_2024 
EXCEPT
SELECT cliente_id, nombre FROM clientes_2023
ORDER BY cliente_id ASC;