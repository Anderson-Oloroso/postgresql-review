INSERT INTO images(nombre, archivo)
SELECT 'imagen.jpg', pg_read_binary_file('/home/camper/postgresdata/image.jpg');