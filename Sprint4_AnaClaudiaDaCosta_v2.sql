-- Sprint 4 - Creación de Base de Datos

-- creamos la BD 'Marketplace'
CREATE DATABASE marketplace;

use marketplace;

-- creamos la tabla temporal products
CREATE TABLE IF NOT EXISTS products_temp (
id VARCHAR(250) NULL,
product_name VARCHAR(500) NULL,
price VARCHAR(500) NULL,
colour VARCHAR(500) NULL,
weight VARCHAR(500) NULL,
warehouse_id VARCHAR(500) NULL
); 

-- creamos la tabla temporal company
CREATE TABLE IF NOT EXISTS company_temp (
company_id VARCHAR(500) NULL,
company_name VARCHAR(500) NULL,
phone VARCHAR(500) NULL,
email VARCHAR(500) NULL,
country VARCHAR(500) NULL,
website VARCHAR(500) NULL
); 

-- creamos la tabla temporal credit_card
CREATE TABLE IF NOT EXISTS credit_card_temp (
id VARCHAR(500) NULL,
user_id VARCHAR(500) NULL,
iban VARCHAR(500) NULL,
pan VARCHAR(500) NULL,
pin VARCHAR(500) NULL,
cvv VARCHAR(500) NULL,
track1 VARCHAR(500) NULL,
track2 VARCHAR(500) NULL,
expiring_date VARCHAR(500) NULL
);

-- creamos la tabla temporal american_users
CREATE TABLE IF NOT EXISTS american_users_temp (
id VARCHAR(500) NULL,
name VARCHAR(500) NULL,
surname VARCHAR(500) NULL,
phone VARCHAR(500) NULL,
email VARCHAR(500) NULL,
birth_date VARCHAR(500) NULL,
country VARCHAR(500) NULL,
city VARCHAR(500) NULL,
postal_code VARCHAR(500) NULL,
address VARCHAR(500) NULL
);

-- creamos la tabla temporal european_users
CREATE TABLE IF NOT EXISTS european_users_temp (
id VARCHAR(500) NULL,
name VARCHAR(500) NULL,
surname VARCHAR(500) NULL,
phone VARCHAR(500) NULL,
email VARCHAR(500) NULL,
birth_date VARCHAR(500) NULL,
country VARCHAR(500) NULL,
city VARCHAR(500) NULL,
postal_code VARCHAR(500) NULL,
address VARCHAR(500) NULL
);

-- creamos la tabla temporal transactions
CREATE TABLE IF NOT EXISTS transaction_temp (
id VARCHAR(500) NULL,
card_id VARCHAR(500) NULL,
business_id VARCHAR(500) NULL,
timestamp VARCHAR(500) NULL,
amount VARCHAR(500) NULL,
declined VARCHAR(500) NULL,
product_ids VARCHAR(500) NULL,
user_id VARCHAR(500) NULL,
lat VARCHAR(500) NULL,
longitude VARCHAR(500) NULL
);

-- cargamos datos em la tabla temporal 'products_temp'
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products.csv'
INTO TABLE products_temp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- consultamos la carga de los datos
SELECT *
FROM products_temp
LIMIT 5;

-- consultamos la tabla 'company_temp'
SELECT *
FROM company_temp;

-- cargamos datos em la tabla temporal 'company_temp'
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\companies.csv'
INTO TABLE company_temp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- consultamos la carga de los datos
SELECT *
FROM company_temp
LIMIT 5;

-- consultamos la tabla 'credit_card_temp'
SELECT *
FROM credit_card_temp;

-- cargamos datos em la tabla temporal 'credit_card_temp'
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\credit_cards.csv'
INTO TABLE credit_card_temp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- consultamos la carga de los datos
SELECT *
FROM credit_card_temp
LIMIT 5;

-- vamos a utilizar apenas una tabla users ya que las columnas son las mismas tanto para american cuanto para european users

-- cambiamos el nombre de la tabla 'amarican_users_temp' a 'users_temp'
RENAME TABLE american_users_temp TO users_temp;

-- consultamos el cambio de nombre de la tabla
DESC users_temp;

-- borramos la tabla 'european_users_temp'
DROP TABLE european_users_temp;

-- consultamos la tabla
DESC european_users_temp;

-- consultamos la tabla 'users_temp'
SELECT *
FROM users_temp;

-- cargamos datos de la tabla american_users en la tabla temporal 'users_temp'
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\american_users.csv'
INTO TABLE users_temp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- consultamos la carga de los datos
SELECT *
FROM users_temp
LIMIT 5;

-- cargamos datos de la tabla european_users en la tabla temporal 'users_temp'
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\european_users.csv'
INTO TABLE users_temp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- consultamos la tabla 'transaction_temp'
SELECT *
FROM transaction_temp;

-- cargamos datos en la tabla temporal 'transaction_temp'
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\transactions.csv'
INTO TABLE transaction_temp
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- consultamos la carga de los datos
SELECT *
FROM transaction_temp;

-- una vez los datos estan cargados empezamos a formatarlos en las tablas
-- empezamos por la tabla 'transaction_temp'
DESC transaction_temp;

-- cambiamos el tipo de dato de VARCHAR(500) a VARCHAR(38)
ALTER TABLE transaction_temp
MODIFY COLUMN id VARCHAR(38);

-- cambiamos el tipo de dato de VARCHAR(500) a VARCHAR(8)
ALTER TABLE transaction_temp
MODIFY COLUMN card_id VARCHAR(8);

-- cambiamos el tipo de dato de VARCHAR(500) a VARCHAR(6)
ALTER TABLE transaction_temp
MODIFY COLUMN business_id VARCHAR(6);

-- cambiamos el tipo de dato de VARCHAR(500) a TIMESTAMP
ALTER TABLE transaction_temp
MODIFY COLUMN timestamp TIMESTAMP;

-- cambiamos el tipo de dato de VARCHAR(500) a DECIMAL(10,2)
ALTER TABLE transaction_temp
MODIFY COLUMN amount DECIMAL(10,2);

-- cambiamos el tipo de dato de VARCHAR(500) a TINYINT(1)
ALTER TABLE transaction_temp
MODIFY COLUMN declined TINYINT(1);

-- cambiamos el tipo de dato de VARCHAR(500) a INT
ALTER TABLE transaction_temp
MODIFY COLUMN user_id INT;

-- cambiamos el tipo de dato de VARCHAR(500) a FLOAT
ALTER TABLE transaction_temp
MODIFY COLUMN lat FLOAT;

-- cambiamos el tipo de dato de VARCHAR(500) a FLOAT
ALTER TABLE transaction_temp
MODIFY COLUMN longitude FLOAT;

-- consultamos los cambios
DESC transaction_temp;

-- renombramos la tabla
RENAME TABLE transaction_temp to transaction;

-- consultamos
SELECT *
FROM transaction
LIMIT 5;

-- formatamos los datos de la tabla 'credit_card_temp'

-- consultamos la formatación actual
DESC credit_card_temp;

-- cambiamos el tipo de dato de VARCHAR(500) a lo que corresponda
ALTER TABLE credit_card_temp
MODIFY COLUMN id VARCHAR(8),
MODIFY COLUMN user_id INT,
MODIFY COLUMN iban VARCHAR(34),
MODIFY COLUMN pan VARCHAR(20),
MODIFY COLUMN pin VARCHAR(4),
MODIFY COLUMN cvv VARCHAR(3),
MODIFY COLUMN track1 VARCHAR(100),
MODIFY COLUMN track2 VARCHAR(100)
;

-- consultamos los cambios
DESC credit_card_temp;

-- renombramos la tabla
RENAME TABLE credit_card_temp TO credit_card;

-- consultamos la tabla
SELECT * 
FROM credit_card
LIMIT 5;

-- formatamos los datos de la tabla 'company_temp'
-- consultamos la formatación actual
DESC company_temp;

-- cambiamos el tipo de dato de VARCHAR(500) a lo que corresponda
ALTER TABLE company_temp 
MODIFY COLUMN company_id VARCHAR(6),
MODIFY COLUMN company_name VARCHAR(150),
MODIFY COLUMN phone VARCHAR(15),
MODIFY COLUMN email VARCHAR(100),
MODIFY COLUMN country VARCHAR(100),
MODIFY COLUMN website VARCHAR(150)
;
-- -- consultamos los cambios
DESC company_temp;

-- renombramos la tabla de 'company_temp' a 'company'
RENAME TABLE company_temp TO company;

-- consultamos la tabla
SELECT * 
FROM company
LIMIT 5;

-- formatamos los datos de la tabla 'users_temp'
-- consultamos los datos de la tabla
DESC users_temp;

-- cambiamos los tipos de datos de las columnas de VARCHAR(500) a lo que corresponda
ALTER TABLE users_temp
MODIFY COLUMN id INT,
MODIFY COLUMN name VARCHAR(150),
MODIFY COLUMN surname VARCHAR(150),
MODIFY COLUMN phone VARCHAR(15),
MODIFY COLUMN email VARCHAR(100),
MODIFY COLUMN birth_date VARCHAR(12),
MODIFY COLUMN country VARCHAR(100),
MODIFY COLUMN city VARCHAR(100),
MODIFY COLUMN postal_code VARCHAR(10),
MODIFY COLUMN address VARCHAR(255)
;

-- -- consultamos los cambios
DESC users_temp;

-- renombramos la tabla de 'users_temp' a 'users'
RENAME TABLE users_temp TO users;

-- consultamos la tabla users
SELECT *
FROM users
LIMIT 5;

-- creamos las PK en las tablas

-- consultamos la tabla company
DESC company;

-- en la tabla 'company' creamos la PK en la columna 'company_id'
ALTER TABLE company
ADD PRIMARY KEY (company_id);

-- consultamos la PK creada
DESC company;

-- consultamos la tabla 'credit_card'
DESC credit_card;

-- en la tabla  'credit_card' creamos la PK en la columna 'id'
ALTER TABLE credit_card
ADD PRIMARY KEY (id);

-- consultamos la PK creada
DESC credit_card;

-- consultamos la tabla 'users'
DESC users;

-- en la tabla 'users' creamos la PK en la columna 'id'
ALTER TABLE users
ADD PRIMARY KEY (id);

-- consultamos la PK creada
DESC users;

-- consultamos la tabla 'transaction'
DESC transaction;

-- en la tabla 'transaction' creamos la PK en la columna 'id'
ALTER TABLE transaction
ADD PRIMARY KEY (id);

-- consultamos la PK creada en la tabla 'transaction'
DESC transaction;

-- creamos las FKs en la tabla 'transaction'

ALTER TABLE transaction
ADD CONSTRAINT fk_transaction_creditcard
FOREIGN KEY (card_id) REFERENCES credit_card(id)
ON DELETE RESTRICT;

ALTER TABLE transaction
ADD CONSTRAINT fk_transaction_company
FOREIGN KEY (business_id) REFERENCES company(company_id)
ON DELETE RESTRICT;

ALTER TABLE transaction
ADD CONSTRAINT fk_transaction_users
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE RESTRICT;

-- consultamos la creación de las FKs
DESC transaction;

-- usuarios con más de 80 transacciones
SELECT *
FROM users AS u
WHERE EXISTS(-- subquery para encontrar los usuarios con más de 80 transacciones
			SELECT t.user_id
			FROM transaction AS t
			WHERE t.user_id = u.id
			HAVING COUNT(t.id) > 80
			) 
    ;
    
-- media de amount por IBAN de las tarjetas de crédito en la compañía Donec Ltd.
SELECT c.company_name, cc.iban, ROUND(AVG(t.amount),2) as average_amount
FROM transaction AS t
LEFT JOIN company AS c
ON t.business_id = c.company_id
LEFT JOIN credit_card AS cc
ON t.card_id = cc.id
WHERE c.company_name = 'Donec Ltd'
GROUP BY c.company_name, cc.iban
;

-- Nivel 2
-- crear una nueva tabla con el estado de las tarjetas de crédito basado en si las últimas tres transacciones fueron declinadas
CREATE TABLE card_status AS
	SELECT consulta2.card_id,
			CASE -- agrega una columna con el estado de las tarjetas
				WHEN SUM(consulta2.declined) = 3 THEN 'INACTIVE'
				ELSE 'ACTIVE'
			END AS card_status
				FROM (-- select para selecionar las últimas 3 transacciones
					SELECT consulta1.*
					FROM (-- select para incluir un rango en las transacciones ordenadas por fechas de más a menos reciente
						SELECT t.*, ROW_NUMBER () OVER (PARTITION BY t.card_id ORDER BY t.timestamp DESC) AS cardrank
						FROM transaction AS t
						) AS consulta1
				WHERE cardrank <= 3)AS consulta2
	GROUP BY consulta2.card_id            
;

-- consultamos la tabla creada
SELECT * 
FROM card_status;

-- consultamos cuantas tarjetas están activas
SELECT COUNT(card_id)
FROM card_status
WHERE card_status = 'ACTIVE';

-- consultamos las caracteristicas de la tabla 
DESC card_status;

-- creo la relación entre la nueva tabla 'card_status' y la tabla 'credit_card
ALTER TABLE card_status 
ADD CONSTRAINT fk_cardstatus_creditcard
FOREIGN KEY (card_id) REFERENCES credit_card(id)
ON DELETE RESTRICT;


-- consultamos la FK creada
DESC card_status;


-- Nivel 3

-- consultamos la tabla 'products_temp'
DESC products_temp;

-- actualizamos los tipos de los campos en la tabla 'products_temp'
ALTER TABLE products_temp
MODIFY COLUMN id INT,
MODIFY COLUMN product_name VARCHAR(250),
MODIFY COLUMN price VARCHAR(255),
MODIFY COLUMN colour VARCHAR(7),
MODIFY COLUMN weight DECIMAL(10,1),
MODIFY COLUMN warehouse_id VARCHAR(10);

-- consultamos la actualización
DESC products_temp;

-- renombramos la tabla 'products_temp' a 'products'
RENAME TABLE products_temp to products;

-- consultamos la tabla
SELECT *
FROM products;

-- creamos la tabla puente 'transaction_products'
CREATE TABLE transaction_products (
    transaction_id VARCHAR(38),
    product_id INT
);


-- consultamos la tabla
DESC transaction_products;

-- insertamos los datos en la tabla creada 
INSERT INTO transaction_products (transaction_id, product_id)
SELECT t.id, jt.product_id
FROM transaction AS t
JOIN JSON_TABLE(
			 CONCAT('[', t.product_ids, ']'),
			"$[*]" COLUMNS (product_id INT PATH "$")
) AS jt
;


-- consultamos la tabla
SELECT * 
FROM transaction_products;

-- consultamos un registro de la tabla transaction para comparación si se hizo bien
SELECT product_ids
FROM transaction
WHERE id = '00043A49-2949-494B-A5DD-A5BAE3BB19DD';

-- creamos las relacciones entre las tablas 'transaction_products' y 'transaction'
ALTER TABLE transaction_products
ADD CONSTRAINT fk_transprod_transaction
FOREIGN KEY (transaction_id) REFERENCES transaction (id)
ON DELETE SET NULL;


-- definimos la PK en la tabla 'products'
ALTER table products
ADD PRIMARY KEY (id);

-- consultamos la creación de la PK
DESC products;

-- creamos las relacciones entre las tablas 'transaction_products' y 'products'
ALTER TABLE transaction_products
ADD CONSTRAINT fk_transprod_products
FOREIGN KEY (product_id) REFERENCES products(id)
ON DELETE SET NULL;


-- consultamos la creación de las FK en la tabla puente 'transaction_products
DESC transaction_products;

-- consultamos cuantas veces se vendió cada producto
SELECT tp.product_id, p.product_name, COUNT(tp.transaction_id) AS sales
FROM transaction_products AS tp
LEFT JOIN products AS p
ON tp.product_id = p.id
GROUP BY tp.product_id, p.product_name
ORDER BY tp.product_id;

