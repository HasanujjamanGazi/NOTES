SELECT *
FROM customers
WHERE country = 'USA' AND score > 500

SELECT *
FROM customers
WHERE country = 'USA' OR score > 500

SELECT *
FROM customers
WHERE NOT country = 'USA'

SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500

SELECT *
FROM customers
WHERE country IN ('Germany', 'USA')

SELECT *
FROM customers
WHERE first_name LIKE 'M%'

SELECT * 
FROM customers
WHERE first_name LIKE '%n'

SELECT * 
FROM customers
WHERE first_name LIKE '%r%'

SELECT * 
FROM customers
WHERE first_name LIKE '__r%'

