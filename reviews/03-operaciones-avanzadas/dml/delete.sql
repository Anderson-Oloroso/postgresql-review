-- Eliminar productos obsoletos (stock 0 y sin transacciones en ventas)
DELETE FROM productos 
WHERE stock = 0 
  AND id NOT IN (
      SELECT DISTINCT producto_id 
      FROM ventas 
      WHERE producto_id IS NOT NULL
  )
RETURNING id, nombre, stock;

-- 1. Consultar los productos restantes
SELECT * FROM productos;

-- 2. Verificar por qué 'Monitor Gamer 24" Dell' NO se eliminó
SELECT p.id, p.nombre, p.stock, v.cantidad 
FROM productos p
LEFT JOIN ventas v ON p.id = v.producto_id;