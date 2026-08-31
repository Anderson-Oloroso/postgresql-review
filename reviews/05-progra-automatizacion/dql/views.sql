-- Crear vista para obtener ventas mensuales acumuladas por vendedor
CREATE VIEW v_ventas_mensuales AS
SELECT 
    vendedor, EXTRACT(YEAR FROM fecha) AS anio,
    EXTRACT(MONTH FROM fecha) AS mes, SUM(monto) AS total_ventas
FROM ventas_vendedores
GROUP BY vendedor, EXTRACT(YEAR FROM fecha), EXTRACT(MONTH FROM fecha);

-- Consulta a la vista creada
SELECT * FROM v_ventas_mensuales
ORDER BY vendedor, anio, mes;

--================= REVIEW ====================
CREATE VIEW vw_ventas_destacadas AS
SELECT id,
       fecha,
       vendedor,
       monto
    FROM ventas_vendedores
    WHERE monto > 300;

SELECT * FROM vw_ventas_destacadas
    ORDER BY monto DESC;

CREATE VIEW vw_resumen_vendedores AS
SELECT vendedor,
       COUNT(*) no_transacciones,
       ROUND(AVG(monto), 2) precio_promedio
    FROM ventas_vendedores
    GROUP BY vendedor 
    ORDER BY COUNT(*) ASC;

SELECT * FROM vw_resumen_vendedores;