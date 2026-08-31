# Review: Funciones de Ventana y CTEs

1. **Comparación de Venta Actual vs. Anterior (LAG)**
   - Obtener un listado de ventas ordenado por vendedor y fecha, mostrando el monto de la venta actual y el monto de la venta inmediatamente anterior realizada por el mismo vendedor (`LAG()`).

2. **Suma Acumulada por Vendedor (LAG y SUM OVER)**
   - Generar una lista detallada de ventas que muestre la fecha, el vendedor, el monto de cada transacción, el monto anterior y la suma acumulada de las ventas realizadas por dicho vendedor hasta la fecha del registro (`SUM() OVER()`).

3. **Ranking General de Mayores Ventas (ROW_NUMBER)**
   - Obtener el listado de todas las ventas ordenadas por monto de mayor a menor, asignando un número de posición (ranking) general a cada venta (`ROW_NUMBER()`).

4. **Porcentaje sobre el Total del Mes (SUM OVER)**
   - Calcular qué porcentaje representa cada venta individual respecto al total general de ventas registradas en todo el mes correspondiente (`SUM() OVER()`).

5. **Comparativo de Ventas Enero vs. Febrero (CTE)**
   - Calcular el monto total vendido por vendedor en los meses de enero y febrero de 2026 mediante CTEs independientes, mostrando el acumulado de cada mes y la diferencia entre ambos períodos.

6. **Vendedores Destacados en Enero (CTE)**
   - Obtener el total vendido y el número de transacciones por cada vendedor durante enero de 2026 mediante una CTE, filtrando únicamente a los vendedores que hayan superado los $2,000.00 en ventas totales.

7. **Reporte de Vendedores Top por Promedio (CTE)**
   - Obtener un reporte con el total acumulado de ventas y el promedio por transacción de cada vendedor durante todo el período registrado. A través de una CTE, calcular estas métricas y filtrar únicamente a los vendedores cuya venta promedio por transacción sea superior a $200.00, ordenando los resultados de mayor a menor según el monto total vendido.