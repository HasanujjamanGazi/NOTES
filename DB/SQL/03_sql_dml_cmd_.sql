--------------------------------------------------------
-- TO SEE THE DATA
SELECT *
FROM customers

--------------------------------------------------------
-- INSERTING DATA
INSERT INTO customers (id, first_name, country, score)
VALUES
	(6, 'Panna', 'India', 910),
	(7, 'Hasan', 'India', 500)

-- WE CAN ADD DATA TO SPECIFIC COL & REST WILL BE NULL
-- ALL 'NOT NULL' COL MUST BE FILLED
INSERT INTO customers (id, first_name)
VALUES
	(8, 'Hena'),
	(9, 'Chini')

--------------------------------------------------------
-- INSERTING DATA FROM ANOTHER TABLE

--CREATING A NEW TABLE TO ADD DATA TO IT FROM A TABLE
CREATE TABLE persons(
	id INT NOT NULL,
	person_name VARCHAR(12) NOT NULL,
	person_dob DATE,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(15),
	CONSTRAINT person_pk PRIMARY KEY (id)
)

-- TO SEE THAT TABLE
SELECT * FROM persons

-- NOW INSERTING DATA TO 'PERSONS' FROM 'CUSTOMERS' USING 'SELECT'
INSERT INTO persons (id, person_name, person_dob, email, phone)
SELECT
	id,
	first_name,
	NULL,
	'Unknown',
	'Unknown'
FROM customers

--------------------------------------------------------
-- CHANGING DATA OF ALREADY EXISTING ROW
-- ALWAYS USE 'WHERE' OTHERWISE IT WILL CHANGE ALL THE ROWS

-- GOOD PRACTICE 

-- FIRST CHECK WITH SELECT THAT WE WROTE THE WHERE CONDITION IN RIGHT
SELECT country
FROM customers
WHERE first_name = 'Hasan'

-- THEN UPDATE THE VALUE WITH THAT WHERE
UPDATE customers
SET country = 'India'
WHERE first_name = 'Hasan'

UPDATE customers
SET country = 'Japan',
	score = 550
WHERE first_name = 'Chini'

--------------------------------------------------------
-- DELETING DATA FROM TABLE

-- ALWAYS CHECK THE WHERE FIRST
SELECT *
FROM customers
WHERE country IS NULL

-- THEN PROCEED WITH DELETION
DELETE FROM customers
WHERE score IS NULL

