UPDATE Maquinas
SET precio_hora = (SELECT min(precio_hora) + (precio_hora*0.1))
WHERE precio_hora <= (SELECT max(precio_hora));