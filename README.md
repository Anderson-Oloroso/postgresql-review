# PostgreSQL - Review

Repositorio personal para documentar y resolver reviews prácticos de PostgreSQL como parte de una ruta de aprendizaje.

## Objetivo

Reforzar los conocimientos de PostgreSQL mediante ejercicios prácticos relacionados con:

- Diseño y definición de bases de datos.
- Creación y modificación de tablas.
- Inserción, actualización y eliminación de datos.
- Consultas SQL.
- Relaciones entre tablas.
- Operaciones CRUD.
- Buenas prácticas en PostgreSQL.


## Estructura actual del repositorio

```text
postgresql-review/
├── reviews/
│   ├── 01-campus/
│   │   ├── ddl/
│   │   │   └── schema.sql
│   │   ├── dml/
│   │   │   ├── delete.sql
│   │   │   ├── insert.sql
│   │   │   └── update.sql
│   │   ├── dql/
│   │   │   └── queries.sql
│   │   └── ejercicios_crud.md
│   │
│   ├── 02-biblioteca/
│   │   ├── ddl/
│   │   │   └── schema.sql
│   │   ├── dml/
│   │   │   └── inserts.sql
│   │   ├── dql/
│   │   │   └── queries.sql
│   │   └── review_consultas.md
│   │
│   └── 03-operaciones-avanzadas/
│       ├── backup/
│       │   ├── customers_bck.sql
│       │   └── customers_bck.tar
│       ├── cleanup/
│       │   └── duplicates.sql
│       ├── ddl/
│       │   └── schema.sql
│       ├── dml/
│       │   ├── delete.sql
│       │   ├── insert.sql
│       │   └── update.sql
│       ├── dql/
│       │   └── queries.sql
│       ├── import/
│       │   ├── data_add.csv
│       │   └── data.csv
│       └── instrucciones.md
└── README.md
```

## Reviews realizados
### 01-campus
Review enfocado en el diseño y manejo de una base de datos para estudiantes de la escuela Campus.

Durante este review se trabajaron los principales comandos SQL:

- **DDL:** creación de la estructura de la base de datos y sus tablas.
- **DML:** inserción, actualización y eliminación de registros mediante `INSERT`, `UPDATE` y `DELETE`.
- **DQL:** consulta de información utilizando `SELECT`.

El objetivo fue practicar las operaciones básicas de gestión de datos y realizar consultas sobre la información de los estudiantes.

### 02-biblioteca

Review enfocado en la consulta y análisis de una base de datos para una biblioteca.

Durante este review se trabajaron los principales comandos y cláusulas de DQL mediante consultas sobre libros y autores, utilizando:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `LIKE` 
- `BETWEEN`
- `JOIN`
- Funciones de agregación como `COUNT`, `AVG`, `MIN` y `MAX`
- `GROUP BY`
- `HAVING`

El objetivo fue practicar la obtención, filtrado, ordenamiento y análisis de información relacionada con libros, autores, precios, fechas de publicación y nacionalidades.

### 03-operaciones-avanzadas

Review enfocado en operaciones avanzadas de administración, mantenimiento y manipulación de datos en PostgreSQL.

Durante este review se trabajaron conceptos y herramientas clave de nivel backend:

- **Carga masiva de datos:** importación desde archivos CSV utilizando comandos `\copy`.
- **Gestión de secuencias y unicidad:** restricción `UNIQUE`, manejo de conflictos con `ON CONFLICT ... DO NOTHING` y resincronización de secuencias con `SETVAL` y `pg_get_serial_sequence`.
- **Actualizaciones complejas:** sincronización entre tablas mediante `UPDATE ... FROM`, uso de la cláusula `RETURNING` y captura de datos en variables dentro de bloques procedurales `DO` (PL/pgSQL).
- **Limpieza de datos (Cleanup):** eliminación condicional con subconsultas (`DELETE ... WHERE NOT IN`) y deduplicación avanzada mediante `CTE` y funciones de ventana (`ROW_NUMBER() OVER`).
- **Respaldos y restauración (CLI):** generación de backups en formato plano (`.sql`) y binario (`.tar`) usando `pg_dump`, y su posterior restauración con `psql` y `pg_restore`.