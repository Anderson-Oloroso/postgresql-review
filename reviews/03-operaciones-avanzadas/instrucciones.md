# Review 03: Operaciones avanzadas en PostgreSQL

## Objetivo

Practicar diferentes operaciones y herramientas de PostgreSQL utilizando la base de datos `campus`.

## Temas a practicar

- Crear base de datos con `CREATE DATABASE`.
- Crear tablas con `CREATE TABLE`.
- Insertar registros con `INSERT`.
- Actualizar datos con `UPDATE`.
- Eliminar registros con `DELETE`.
- Agregar restricciones `UNIQUE` mediante `ALTER TABLE`.
- Evitar registros duplicados usando `ON CONFLICT`.
- Importar datos desde archivos CSV utilizando `COPY` y `\copy`.
- Sincronizar secuencias con `setval` y `pg_get_serial_sequence`.
- Actualizar datos utilizando `UPDATE ... FROM`.
- Obtener datos modificados utilizando `RETURNING`.
- Utilizar bloques `DO` y variables en PL/pgSQL.
- Crear respaldos con `pg_dump`.
- Restaurar respaldos con `psql` y `pg_restore`.
- Identificar y eliminar registros duplicados con `ROW_NUMBER()` y CTE.

## Instrucciones

1. Utilizar la base de datos existente `campus_store`.
2. Crear la tabla `customers`.
3. Insertar varios clientes.
4. Importar clientes desde un archivo CSV utilizando `\copy`.
5. Agregar una restricción de unicidad para el correo electrónico.
6. Probar inserciones evitando correos duplicados con `ON CONFLICT`.
7. Actualizar clientes utilizando otra tabla auxiliar.
8. Practicar `UPDATE ... RETURNING`.
9. Utilizar un bloque `DO` para capturar un valor actualizado.
10. Eliminar productos sin ventas y con stock igual a cero.
11. Crear una tabla con datos duplicados.
12. Detectar y eliminar duplicados utilizando una CTE y `ROW_NUMBER()`.
13. Crear un respaldo de la tabla `customers` usando `pg_dump`.
14. Restaurar el respaldo en una base de datos temporal.
15. Verificar que los datos restaurados sean correctos.

## Notas
- Poblar la tabla customers import/
```bash
\copy customers(first_name, last_name, email) FROM 'C:/Users/Henrik/Downloads/Extras/PostgreSQL/postgresql-review/reviews/03-operaciones-avanzadas/import/data.csv' DELIMITER ',' CSV HEADER;
```

- Poblar la tabla customers_add desde import/
```bash
\copy customers_add(id, first_name, last_name, email) FROM 'C:/Users/Henrik/Downloads/Extras/PostgreSQL/postgresql-review/reviews/03-operaciones-avanzadas/import/data_add.csv' DELIMITER ',' CSV HEADER;
```

- Sincronizar la secuencia del ID
```sql
-- Verificar el valor máximo actual del ID y ajustar la secuencia automáticamente
SELECT SETVAL(
    pg_get_serial_sequence('customers', 'id'),
    (SELECT MAX(id) FROM customers)
);
```
*Post insersiones ON CONFLIC*
- Al realizar la siguiente consulta se encontró que los id: 11, 13 no están
```sql
-- 1. Consultar todos los clientes agregados hasta el momento
SELECT * FROM customers ORDER BY id;
```
esto pasa debido a que antes de ejecutar el script.
 - ¿Qué pasó con el id 11?
 Premutación de la secuencia: Luego de la ejecución `SELECT nextval(...)` consumió el id del contador en memoria de la base de datos.
 - ¿Qué pasó con el id 13?
 Consumo por insersiones fallidas: Luego de la ejecución `INSERT ... ON CONFLICT DO NOTHING` PostgreSQL solicita el siguiente valor de la secuencia, y al detectar la violación por unicidad debido a que el correo es de tipo `UNIQUE`, la fila no se insertó, pero queda descartado el id 13.

 *Por razones de rendimiento y concurrencia multiusuario, las secuencias nunca hacen un rollback. Si una transacción falla, se cancela o se omite mediante `ON CONFLICT`, los IDs asignados durante esa transacción se pierden permanentemente.*

- Backup en sql realizado desde powershell
```bash
pg_dump -U ilark -d campus_store -t customers > "C:/Users/Henrik/Downloads/Extras/PostgreSQL/postgresql-review/reviews/03-operaciones-avanzadas/backup/customers_bck.sql"
```

- Backup en formato binario .tar
```bash
pg_dump -U ilark -d campus_store -t customers -F t -f "C:/Users/Henrik/Downloads/Extras/PostgreSQL/postgresql-review/reviews/03-operaciones-avanzadas/backup/customers_bck.tar"
```

- Restaurar backup plano en SQL
```bash
psql -U ilark -d campus_temp -f "C:/Users/Henrik/Downloads/Extras/PostgreSQL/postgresql-review/reviews/03-operaciones-avanzadas/backup/customers_bck.sql"
```

- Restaurar backup en fomato binaro TAR con pg_restore
```bash
pg_restore -U ilark -d campus_temp "C:/Users/Henrik/Downloads/Extras/PostgreSQL/postgresql-review/reviews/03-operaciones-avanzadas/backup/customers_bck.tar"
```

