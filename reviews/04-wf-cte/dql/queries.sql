-- 1. Comparación de venta actual vs. venta anterior por vendedor (LAG)
SELECT 
    fecha, 
    vendedor, 
    monto AS monto_actual, 
    LAG(monto) OVER(PARTITION BY vendedor ORDER BY fecha) AS monto_anterior
FROM ventas_vendedores
ORDER BY vendedor, fecha;

-- 2. Ventas acumuladas por día y por vendedor (LAG y SUM OVER)
SELECT 
    fecha, 
    vendedor, 
    monto AS monto_actual, 
    LAG(monto) OVER(PARTITION BY vendedor ORDER BY fecha) AS monto_anterior,
    SUM(monto) OVER(PARTITION BY vendedor ORDER BY fecha) AS monto_acumulado
FROM ventas_vendedores
ORDER BY vendedor, fecha;

-- 3. Ranking general de ventas por monto (ROW_NUMBER)
SELECT 
    fecha, 
    vendedor, 
    monto,
    ROW_NUMBER() OVER(ORDER BY monto DESC) AS ranking
FROM ventas_vendedores;

-- 4. Porcentaje de cada venta respecto al total del mes (SUM OVER)
SELECT 
    fecha, 
    vendedor, 
    monto, 
    ROUND((monto / SUM(monto) OVER(PARTITION BY DATE_TRUNC('month', fecha))) * 100, 2) AS porcentaje_mes
FROM ventas_vendedores;

-- 5. Comparativo de ventas de Enero vs. Febrero y su diferencia
WITH ventas_enero AS (
    SELECT 
        vendedor, 
        SUM(monto) AS total_enero
    FROM ventas_vendedores
    WHERE fecha >= '2026-01-01' AND fecha < '2026-02-01'
    GROUP BY vendedor
), 
ventas_febrero AS (
    SELECT 
        vendedor, 
        SUM(monto) AS total_febrero
    FROM ventas_vendedores
    WHERE fecha >= '2026-02-01' AND fecha < '2026-03-01'
    GROUP BY vendedor
)
SELECT 
    COALESCE(e.vendedor, f.vendedor) AS vendedor,
    COALESCE(e.total_enero, 0) AS enero,
    COALESCE(f.total_febrero, 0) AS febrero,
    COALESCE(f.total_febrero, 0) - COALESCE(e.total_enero, 0) AS diferencia
FROM ventas_enero e 
FULL OUTER JOIN ventas_febrero f 
    ON e.vendedor = f.vendedor
ORDER BY vendedor;

-- 6. Vendedores con ventas superiores a $2,000 en Enero 2026
WITH ventas_enero AS (
    SELECT 
        vendedor, 
        SUM(monto) AS total_venta, 
        COUNT(*) AS num_transacciones
    FROM ventas_vendedores
    WHERE fecha >= '2026-01-01' AND fecha < '2026-02-01'
    GROUP BY vendedor
)
SELECT 
    vendedor, 
    total_venta, 
    num_transacciones 
FROM ventas_enero 
WHERE total_venta > 2000.00;

-- 7. Vendedores con promedio por transacción superior a $200.00
WITH reporte_total AS (
    SELECT 
        vendedor,
        SUM(monto) AS total_acumulado,
        ROUND(AVG(monto), 2) AS promedio
    FROM ventas_vendedores
    GROUP BY vendedor
)
SELECT 
    vendedor, 
    total_acumulado, 
    promedio
FROM reporte_total
WHERE promedio > 200.00
ORDER BY total_acumulado DESC;