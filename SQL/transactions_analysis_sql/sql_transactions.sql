use transactions;

-- Sprint 2

-- Nivel 1
-- Ejercicio 2 - Utilizando JOIN realizarás las siguientes consultas

-- Listado de los paises que están generando ventas

SELECT DISTINCT c.country 
FROM transaction as t
JOIN company as c
ON t.company_id = c.id
ORDER BY c.country
;

-- Desde cuántos paises se generan las ventas

SELECT COUNT(DISTINCT c.country) as cantidad_paises_ventas 
FROM transaction as t
JOIN company as c
ON t.company_id = c.id
ORDER BY c.country
;

-- Compañia con la mayor media de ventas

SELECT ROUND (AVG(t.amount),2) as media_ventas, c.company_name 
FROM transaction as t
JOIN company as c
ON t.company_id = c.id
GROUP BY c.company_name
ORDER BY media_ventas DESC
LIMIT 1
;

-- Nivel 1
-- Ejercicio 3 - Utilizando sólo subconsultas (sin utilizar JOIN):

--  Transacciones realizadas por empresas de Alemania.

SELECT * 
FROM transaction as t
WHERE t.company_id IN 	
    ( -- Subquery para seleccionar apenas los id de Alemania
    SELECT c.id 
     FROM company as c
	 WHERE c.country = 'Germany')
;

-- Empresas que han realizado transacciones por un amount superior a la media de todas las transacciones

SELECT c.company_name
FROM company AS c
WHERE c.id IN 
			(	-- Subquery para encontrar las empresas con media de ventas por encima de la media general
			SELECT t.company_id 
            FROM transaction as t
            GROUP BY t.company_id
			HAVING ROUND(AVG(t.amount),2) >
					( -- Subquery para encontrar la media general
					SELECT AVG(t.amount) as media_general 
                    FROM transaction as t
					)
                    
			)
    ;

-- empresas que carecen de transacciones registradas

SELECT c.id, c.company_name 
FROM company AS c
WHERE c.id NOT IN 
	( -- Subquery para identificar los company_id de las transacciones
    SELECT DISTINCT t.company_id 
    FROM transaction as t
    )
;

-- Nivell 2
-- Ejercicio 1
-- Identifica los cinco días que se generó la mayor cantidad de ingresos en la empresa por ventas. 
-- Muestra la fecha de cada transacción junto con el total de las ventas.  

SELECT  DATE(t.timestamp), SUM(amount) AS total_ventas
FROM transaction AS t
WHERE company_id = 'b-2222' -- para selecionar una empresa en específico. Si lo que se pretende es saber la información general, comentar esta linea.
GROUP BY  DATE(t.timestamp)
ORDER BY total_ventas DESC
LIMIT 5
;

-- Nivel 2
-- Ejercicio 2
-- Media de ventas por país ordenado de maior a menor

SELECT c.country, ROUND(AVG(t.amount),2) AS media_ventas
FROM transaction AS t
JOIN company as c
ON t.company_id = c.id
GROUP BY c.country
ORDER BY media_ventas DESC
;

-- Nivel 2
-- Ejercicio 3
-- lista de todas las transacciones realizadas por empresas que están ubicadas en el mismo país que la compañía “Non Institute”

-- 1 listado aplicanco JOIN y Subconsulta
SELECT *
FROM transaction as t
JOIN company as c
ON t.company_id = c.id
WHERE c.country =	
    (-- select para identificar el pais de la compañia 'Non Institute'
	SELECT c.country
	FROM company as c
	WHERE company_name ='Non institute'
	)
AND c.id <>    
	(-- select para identificar el ID de la compañia 'Non Institute'
	SELECT c.id
	FROM company as c
	WHERE company_name ='Non institute'
	)
;

-- listado aplicando solo subconsultas

SELECT *
FROM transaction
HAVING company_id IN
	( -- select para identificar los IDs de las compañias del mismo pais que la compañia 'Non Institute'
    SELECT c.id
	FROM company as c
	WHERE c.country =	
		( -- select para identificar el pais da la compañia 'Non Institute'
		SELECT c.country
		FROM company as c
		WHERE company_name = 'Non Institute')
	AND c.id <>
			(-- select para identificar el id da la compañia 'Non Institute'
			SELECT c.id
			FROM company as c
			WHERE company_name = 'Non Institute')
		)
        ;
        
-- Nivel 3
-- Ejercicio 1
-- Presenta el nombre, teléfono, país, fecha y amount, de aquellas empresas que realizaron transacciones con un valor comprendido entre 350 y 400 euros 
-- y en alguna de estas fechas: 29 de abril de 2015, 20 de julio de 2018 y 13 de marzo de 2024. Ordena los resultados de mayor a menor cantidad        
        
SELECT * FROM 
	(
	SELECT c.company_name, c.phone, c.country, DATE(t.timestamp) as fecha, t.amount
	FROM transaction AS t
	JOIN company AS c
	ON t.company_id = c.id
	HAVING t.amount BETWEEN 350.00 AND 400.00
	ORDER BY amount DESC
	)consulta1
HAVING consulta1.fecha = '2015-04-29' OR consulta1.fecha = '2018-07-20' OR consulta1.fecha = '2024-03-13'
   
;

-- Nivel 3
-- Ejercicio 2
-- listado de las empresas en las que especifiques si tienen más de 400 transacciones o menos

SELECT listado.company_name, listado.media_ventas,
CASE WHEN listado.media_ventas > 400 THEN 'Más de 400'
ELSE 'Menos de 400'	
END AS Media_ventas
FROM
	(-- select para encontrar la media de las transacciones 
	SELECT c.company_name, COUNT(t.id) AS media_ventas
	FROM company as c
	JOIN transaction as t
	ON c.id = t.company_id
	GROUP BY c.company_name) as listado 
ORDER BY listado.media_ventas ASC
;
