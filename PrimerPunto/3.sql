SELECT c.municipio, count( t.codigC) as 'Cantidad Proyectos'
FROM Conductores c, Proyectos p, Trabajos t
WHERE t.codigC = c.codigoC AND
t.codigoP = p.codigoP
GROUP BY c.municipio, t.codigC
HAVING count(t.codigC) > 2 ;