CREATE TEMP TABLE temporal_json(data JSONB);

\copy temporal_json(data) FROM PROGRAM 'tr -d "\r\n" < /home/camper/Música/HNK/psql/no-sql/categorias.json'

INSERT INTO categorias (codigo, nombre, descripcion)
SELECT
    e->>'codigo' AS codigo,
    e->>'nombre' AS nombre,
    e->>'descripcion' AS descripcion
FROM temporal_json AS t 
CROSS JOIN LATERAL jsonb_array_elements(t.data) AS e;

DROP TABLE temporal_json;