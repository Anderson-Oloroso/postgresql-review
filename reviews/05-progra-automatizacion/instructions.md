# Review 04: Programación y Automatización en PostgreSQL

## Objetivo general

Fortalecer el dominio de la lógica de negocio en PostgreSQL mediante PL/pgSQL, vistas, operadores de conjuntos, procedimientos, funciones y triggers para automatizar procesos y auditorías.

---

## Estructura del proyecto

El proyecto se encuentra organizado de forma modular:

- `ddl/schema.sql`: Estructura de tablas principales y de auditoría.
- `dql/set_operations.sql`: Consultas con operadores de conjuntos.
- `dql/views.sql`: Creación y consulta de vistas.
- `routines/procedures.sql`: Procedimientos almacenados.
- `routines/functions.sql`: Funciones personalizadas.
- `triggers/audit_triggers.sql`: Auditoría automatizada mediante triggers.

---

## Conceptos y operaciones practicadas

### 1. Operaciones de conjuntos

Uso de operadores para combinar y comparar resultados:

- `UNION`: Combina resultados eliminando duplicados.
- `UNION ALL`: Combina resultados conservando duplicados.
- `INTERSECT`: Obtiene registros presentes en ambos conjuntos.
- `EXCEPT`: Obtiene registros del primer conjunto que no existen en el segundo.

### 2. Vistas

Creación de vistas para simplificar consultas complejas, reutilizar reportes y presentar información agregada mediante funciones de cálculo y agrupaciones por fecha.

### 3. Procedimientos almacenados

Implementación de procedimientos en PL/pgSQL para modificar información mediante parámetros y ejecutar procesos directamente desde la base de datos.

### 4. Funciones PL/pgSQL

Desarrollo de funciones personalizadas para realizar cálculos, utilizar variables locales y retornar resultados dinámicos dentro de consultas.

### 5. Auditoría con Triggers

Implementación de un sistema automático de auditoría para registrar modificaciones en las tablas, utilizando funciones disparadoras, valores anteriores y nuevos de los registros y triggers ejecutados después de cada actualización.

---

## Review

### 1. Vista de ventas destacadas

Crear una vista llamada `vw_ventas_destacadas` que contenga únicamente los registros de ventas cuyo monto sea igual o superior a `$300.00`, incluyendo la fecha, el vendedor y el monto.

### 2. Vista de resumen de vendedores

Crear una vista llamada `vw_resumen_vendedores` que muestre la siguiente información de cada vendedor:

- Nombre del vendedor.
- Número total de transacciones realizadas.
- Precio promedio de sus ventas.
- Promedio de ventas redondeado a dos decimales.

### 3. Procedimiento para ajustar precios por bajo stock

Crear un procedimiento llamado `sp_ajustar_precios_bajo_stock` que aplique un incremento porcentual al precio de todos los productos cuyo stock sea menor a un límite recibido por parámetro.

Por ejemplo, el procedimiento puede aumentar un `10%` el precio de los productos que tengan menos de `15` unidades disponibles en inventario.

### 4. Función para aplicar descuento a productos

Crear una función llamada `fn_aplicar_descuento_producto` que reciba los siguientes parámetros:

- El identificador del producto.
- Un porcentaje de descuento.

Por ejemplo, si se recibe un descuento de `15.00`, la función deberá interpretar este valor como un descuento del `15%`.

La función debe calcular y retornar el precio final del producto después de restar el descuento correspondiente al precio original.