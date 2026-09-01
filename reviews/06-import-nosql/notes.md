# Review 06: Importación NoSQL y Datos No Estructurados

## Base de Datos
admin_nosql

## Objetivo General
Explorar los mecanismos de almacenamiento e ingesta de formatos semiestructurados (JSONB, XML) y no estructurados (ARRAY, BYTEA) en PostgreSQL, realizando procesos de carga masiva (ETL) desde la carpeta `import/` hacia tablas relacionales.

---

## Estructura del Módulo

- **ddl/schema.sql**: Definición de la estructura de las tablas maestras, relacionales, vectoriales y binarias.
- **dml/import_json.sql**: Pipeline ETL para procesar `categorias.json` mediante tablas de staging JSONB y funciones de desestructuración.
- **dml/import_xml.sql**: Pipeline ETL para procesar `juegos.xml` utilizando vistas XMLTABLE y mapeo XPath hacia tablas relacionales.
- **dml/insert_arrays.sql**: Manipulación e inserción de arreglos numéricos en columnas tipo `ARRAY`.
- **dml/insert_blob.sql**: Carga binaria del archivo `imagen.jpg` desde el sistema de archivos a columnas tipo `BYTEA`.
- **dql/queries.sql**: Consultas analíticas, validaciones de ingesta, filtros con subconsultas, cruces de información y lecturas sobre tipos complejos.
- **import/**: Carpeta contenedora de los insumos originales (`categorias.json`, `juegos.xml` e `imagen.jpg`).

---

## Conceptos Practicados

### 1. Ingesta de JSONB (categorias.json)
- Uso de tablas temporales con tipos de datos `JSONB`.
- Sanitización de caracteres nulos y saltos de línea con utilidades de consola dentro del comando `\copy`.
- Normalización de arreglos JSON a filas relacionales con la función `jsonb_array_elements`.

### 2. Ingesta de XML (juegos.xml)
- Carga de documentos de texto estructurado en columnas de tipo `XML`.
- Extracción y mapeo explícito de nodos mediante `XMLTABLE` y rutas XPath.
- Limpieza automática de recursos temporales tras la migración.

### 3. Columnas tipo ARRAY
- Definición de tipos de datos vectoriales `INT[]`.
- Indexación de elementos específicos dentro del arreglo.
- Evaluación de longitud con `cardinality()` y búsqueda de valores con el operador `ANY()`.

### 4. Almacenamiento de BLOBs (BYTEA)
- Inserción binaria directa con la función del servidor `pg_read_binary_file()`.
- Cálculo del tamaño de los binarios almacenados mediante la función `octet_length()`.