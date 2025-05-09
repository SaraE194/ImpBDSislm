SELECT id_producto, fecha, precio
FROM fecha_precios
WHERE (id_producto, fecha) IN (
    SELECT id_producto, MAX(fecha)
    FROM fecha_precios
    GROUP BY id_producto
);


SELECT DISTINCT estado
FROM (
    SELECT id_cliente, estado, 
           EXTRACT(MONTH FROM Fecha) AS Mes,
           AVG(Total) OVER (PARTITION BY id_cliente, EXTRACT(MONTH FROM fecha)) AS PromedioMensual
    FROM ventas_mensuales
) AS sub
GROUP BY estado, id_cliente
HAVING MIN(PromedioMensual) > 100;


SELECT proceso, mensaje, MAX(ocurrencia) AS ocurrencia
FROM ocurrencias
GROUP BY mensaje, proceso
HAVING ocurrencia = (
    SELECT MAX(ocurrencia)
    FROM ocurrencias AS p2
    WHERE p2.mensaje = ocurrencias.mensaje
);

