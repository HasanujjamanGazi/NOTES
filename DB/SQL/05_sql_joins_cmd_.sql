SELECT *
FROM customers

SELECT *
FROM orders

-- NOT GOOD PRACTICE IT WILL SHOW ALL THE DATA 
SELECT *
FROM customers
INNER JOIN orders
ON id = customer_id

-- BUT ITS SO ANNOYING TO WRITE ALL THESE
SELECT
	customers.id,
	customers.first_name,
	customers.score,
	orders.order_id,
	orders.order_date,
	orders.sales
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id

-- INSTEAD DO THIS

SELECT
	c.id,
	c.first_name,
	c.score,
	o.order_id,
	o.order_date,
	o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id


SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.order_date,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id

SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.order_date,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id


SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.order_date,
	o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id


SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.order_date,
	o.sales
FROM orders AS o
FULL JOIN customers AS c
ON c.id = o.customer_id

