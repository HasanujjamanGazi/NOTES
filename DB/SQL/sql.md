### SQL



```yml

                           SERVER

                     ┌───────────────┐

                     │               │

              ┌──────┴──────┐ ┌──────┴──────┐

              │  DATABASE   │ │  DATABASE   │

              └──────┬──────┘ └─────────────┘

                     │

            ┌────────┴────────┐

            │                 │

        ┌───┴───┐         ┌───┴───┐

        │SCHEMA │         │SCHEMA │

        └───┬───┘         └───────┘

            │

      ┌─────┴─────┐

      │           │

  ┌───┴───┐   ┌───┴───┐

  │ TABLE │   │ TABLE │

  └───┬───┘   └───────┘

      │

  ┌───┴───┐

  │       │

ROWS   COLUMNS

```



> SQL IS THE LANGUAGE WE USE TO TALK TO A DATABASE.

>

> SERVER HOLDS DATABASES. DATABASE HOLDS SCHEMAS. SCHEMA HOLDS TABLES.

>

> TABLE = ROWS + COLUMNS. LIKE A SPREADSHEET.

>

> EACH ROW HAS A UNIQUE ID. EACH CELL HOLDS ONE VALUE OF ONE TYPE.

#### DATA TYPES

> - NUMERIC  
>
>     - INT — WHOLE NUMBERS  
>
>     - DECIMAL — NUMBERS WITH DECIMAL POINT  
>
> - STRING  
>
>     - CHAR — FIXED LENGTH TEXT  
>
>     - VARCHAR — VARIABLE LENGTH TEXT  
>
> - DATE & TIME  
>
>     - DATE  
>
>     - TIME



#### TYPES OF SQL COMMANDS



> - DDL (DATA DEFINITION LANGUAGE) — CHANGE TABLE STRUCTURE  
>
>     - CREATE  
>
>     - ALTER  
>
>     - DROP  

>

> - DML (DATA MANIPULATION LANGUAGE) — CHANGE DATA INSIDE TABLE  
>
>     - INSERT  
>
>     - UPDATE  
>
>     - DELETE  

>

> - DQL (DATA QUERY LANGUAGE) — READ DATA ONLY  
>
>     - SELECT

#### COMMENTS & CONVENTIONS

> USE COMMENTS TO EXPLAIN CODE. THEY DO NOT RUN.

```sql
-- SINGLE LINE COMMENT

/*

MULTI
LINE
COMMENT

*/
```

> STRINGS GO IN SINGLE QUOTES. DOUBLE QUOTES OFTEN CAUSE ERROR.

```sql

SELECT *
FROM customers
WHERE country = 'Germany'

-- WRONG IN MANY DATABASES:

-- WHERE country = "Germany"
```

#### QUERY DATA (DQL)

> WE USE `SELECT` TO READ DATA FROM A TABLE. A QUERY IS A QUESTION WE ASK THE DATABASE.

>

> `SELECT` DOES NOT CHANGE THE DATABASE — READ ONLY.

>

> #### CLAUSES

>

> A QUERY IS SPLIT INTO PARTS CALLED CLAUSES — `SELECT`, `FROM`, `WHERE`, ETC.

>

> #### CLAUSE ORDER — DEMO

>

> READ QUERY ORDER: `SELECT` → `TOP` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY`



```sql

-- TOP 5 COUNTRIES (ACTIVE, AVG SCORE > 70) BY AVG SCORE

SELECT TOP 5

    country,

    AVG(score) AS avg_score

FROM customers

WHERE active = 1

GROUP BY country

HAVING AVG(score) > 70

ORDER BY avg_score DESC

```



> `SELECT` — WHAT COLUMNS TO SHOW  
>
> `TOP` — HOW MANY ROWS TO RETURN  
>
> `FROM` — WHICH TABLE  
>
> `WHERE` — FILTER ROWS BEFORE GROUPING  
>
> `GROUP BY` — GROUP ROWS (FOR COUNT, AVG, SUM...)  
>
> `HAVING` — FILTER GROUPS AFTER GROUPING  
>
> `ORDER BY` — SORT RESULT (`ASC` LOW→HIGH, `DESC` HIGH→LOW)



> GET THE WHOLE TABLE — `*` MEANS ALL COLUMNS.

```sql

SELECT *

FROM table_name

```

> GET ONLY THE COLUMNS YOU NEED. NO COMMA AFTER THE LAST COLUMN.

```sql

SELECT

    col_1,

    col_2,

    col_3

FROM table_name

```

#### WHERE

> `WHERE` KEEPS ONLY ROWS WHERE THE CONDITION IS TRUE.

```sql

SELECT *

FROM table_name

WHERE condition

```

> COMBINE `SELECT` + `WHERE` TO GET SPECIFIC COLUMNS FROM FILTERED ROWS.

```sql

SELECT

    col_1,

    col_2

FROM table_name

WHERE condition

```

#### SORTING

> USE `ORDER BY` TO SORT RESULTS. DEFAULT IS ASCENDING (LOW TO HIGH).

```sql

SELECT *

FROM table_name

ORDER BY col_2 DESC

-- ASC = LOW TO HIGH (DEFAULT). DESC = HIGH TO LOW.

```
> MULTIPLE COLUMNS: SORT BY FIRST COLUMN FIRST. SECOND COLUMN ONLY BREAKS TIES.

```sql

SELECT *

FROM customers

ORDER BY country ASC, score DESC

-- SAME COUNTRY? THEN SORT BY SCORE.

```


