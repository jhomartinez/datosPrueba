SELECT p.codigoP, p.descripcion, p.cliente, (m.precio_hora* t.tiempo) as 'totalFactura'
FROM Conductores c, Proyectos p, Trabajos t, Maquinas m
WHERE
t.codigoM = m.codigoM AND
t.codigC = c.codigoC AND
t.codigoP = p.codigoP
ORDER BY p.cliente ASC, 'totalFactura' DESC;
