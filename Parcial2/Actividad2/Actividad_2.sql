

SELECT * FROM carrito1 LEFT OUTER JOIN carrito2 ON articulosc1 =articulosc2 union SELECT * FROM carrito1 RIGHT OUTER JOIN carrito2
ON articulosc1=articulosc2;


WITH RECURSIVE Jerarquia AS (
    SELECT Id_empleado, Id_gerente, Puesto, 0 AS Nivel
    FROM GyE
    WHERE Id_gerente IS NULL
    union all
    SELECT e.Id_empleado, e.Id_gerente, e.Puesto, j.Nivel + 1
    FROM GyE e
    JOIN Jerarquia j ON e.Id_gerente = j.Id_empleado
    )
    SELECT * FROM Jerarquia ORDER BY Nivel, Id_empleado;
    

select * FROM pedidos where id_cliente=1001 AND destino='CDMX';