
SELECT 
    d1.CustomerID,
    d2.Number AS Celular,
    d3.Number AS Trabajo,
    d4.Number AS Casa
    FROM directorio_telefono d1
    LEFT JOIN directorio_telefono d2 ON d1.CustomerID = d2.CustomerID AND d2.TypePhone = 'Celular'
    LEFT JOIN directorio_telefono d3 ON d1.CustomerID = d3.CustomerID AND d3.TypePhone = 'Trabajo'
    LEFT JOIN directorio_telefono d4 ON d1.CustomerID = d4.CustomerID AND d4.TypePhone = 'Casa'
    GROUP BY d1.CustomerID;

SELECT Desarrollo FROM etapas_desarrollo WHERE Finalizado IS NULL;


SELECT Id_candidato 
    FROM candidatos 
    WHERE Descripcion IN ('Geologo', 'Astronomo', 'Tecnico')
    GROUP BY Id_candidato
    HAVING COUNT(DISTINCT Descripcion) = 3;