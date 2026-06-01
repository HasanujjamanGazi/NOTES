----------------- DDL --------------------

/*
'CREATE TABLE' IS USED TO CREATE THE
STRUCTURE OF THE TABLE AND ITS VALUE
TYPES & IT DOES NOT ADD ANY ROWS.
*/
-- This code does not give any output.
CREATE TABLE persons(
	id INT NOT NULL,
	person_name VARCHAR(12) NOT NULL,
	person_dob DATE,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(15),
	CONSTRAINT person_pk PRIMARY KEY (id)
)

------------------------------------------

-- To see the table
SELECT * FROM persons

------------------------------------------
-- 'ALTER TABLE' IS USED TO ALTER EXISTING TABLE

ALTER TABLE persons
ADD person_role VARCHAR(20)

ALTER TABLE persons
DROP COLUMN person_role
-- Deleting column will cause loosing data

------------------------------------------
-- 'DROP TABLE' IS USED TO DELETE THE FULL TABLE

DROP TABLE persons
-- WARNING: It will delete the whole table

