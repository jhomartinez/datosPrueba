SELECT c.nombre, c.municipio
FROM Conductores c, Proyectos p, Trabajos t
WHERE p.cliente != 'Henry Pulido' AND
t.codigC = c.codigoC AND
t.codigoP = p.codigoP;