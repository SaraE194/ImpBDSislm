/* 
Implementacion de una base de datos en un sistema de informacion
2025/03/26 4-I
ESPINOSA ARMAS SARA NAYELI
Actividad 4
*/

SELECT flujo, 
       (Caso1 + Caso2 + Caso3) AS Aprobado
FROM f_trabajo;




SELECT A.id_empleado, B.id_empleado, COUNT(*) AS coincidencias
FROM licencias A
JOIN licencias B 
ON A.licencia = B.licencia 
AND A.id_empleado <> B.id_empleado
GROUP BY A.id_empleado, B.id_empleado
HAVING COUNT(*) = 3;




SELECT AVG(entero) AS MEDIA FROM Mm_mr;


WITH Tabla AS (
         SELECT entero, 
                ROW_NUMBER() OVER (ORDER BY Entero) AS fila,
                COUNT(*) OVER () AS total
         FROM Mm_mr
     )
     SELECT AVG(entero) AS MEDIANA
     FROM Tabla
     WHERE fila = CEIL(total / 2.0) OR fila = FLOOR(total / 2.0 + 1);


SELECT entero AS MODA
FROM Mm_mr
GROUP BY entero
ORDER BY COUNT(*) DESC
LIMIT 1;


SELECT (MAX(entero) - MIN(entero)) AS RANGO FROM Mm_mr;
