----------------- DATA QUERY LANGUAGE ------------------

-- THE SIMPLEST COMMAND TO GET ALL THE DATA FROM A TABLE

SELECT *
FROM customers

-------------------------------------------
-- 'WHERE' IS USED TO FILTER OUT THE DATA WE WANT TO SHOW

SELECT *
FROM customers
WHERE country = 'Germany'

-------------------------------------------
-- 'GROUP BY' IS USED TO AGGREGATE DATA AND GET ONE VALUE FROM IT
-- ( WE HAVE TO MENTION ONLY THE COLUMNS THAT TAKE PART IN AGGREGATION )

SELECT
	country,
	SUM(score) as total_scores
FROM  customers
GROUP BY country

-------------------------------------------
-- WE USE 'HAVING' TO FILTER DATA GOT FROM THE AGGREGATION

SELECT
	country,
	SUM(score) as total_scores
FROM  customers
GROUP BY country
HAVING SUM(score) > 800

-------------------------------------------
-- 'DISTINCT' IS USED FOR GETTIG UNIQUE VALUES

SELECT DISTINCT
	country
FROM customers

-------------------------------------------
-- 'ORDER BY' IS USED TO SORT THE DATA BASED ON ANY COLUMN

SELECT *
FROM customers
ORDER BY score DESC

-------------------------------------------
-- 'TOP' IS USED TO SHOW THE TOP N NUMBER OF DATA
-- IT SHOW THE TOP N NUMBER OF DATA AFTER ALL DONE

SELECT TOP 3 *
FROM orders
ORDER BY order_date DESC