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

> WRITE ORDER: `SELECT` → `DISTINCT` → `TOP` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY` → `LIMIT`



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

#### GROUP BY

> `GROUP BY` SPLITS ROWS INTO GROUPS BY A COLUMN (E.G. SAME `country`).
>
> USE WITH AGGREGATES — `SUM`, `COUNT`, `AVG` — TO GET ONE NUMBER PER GROUP.
>
> EVERY COLUMN IN `SELECT` MUST BE IN `GROUP BY` OR INSIDE AN AGGREGATE (LIKE `SUM(score)`).

```sql
-- TOTAL SCORE PER COUNTRY (ONE ROW PER country)
SELECT
    country,
    SUM(score) AS total_scores
FROM customers
GROUP BY country
-- ROWS WITH SAME country ARE GROUPED; SUM ADDS ALL score VALUES IN THAT GROUP
```

#### HAVING

> `HAVING` FILTERS **GROUPS** AFTER `GROUP BY` — LIKE `WHERE`, BUT FOR GROUPS NOT SINGLE ROWS.
>
> `WHERE` RUNS BEFORE GROUPING. `HAVING` RUNS AFTER — USE IT ON AGGREGATES (`SUM`, `COUNT`, `AVG`).

```sql
-- COUNTRIES WHERE TOTAL score IS OVER 800
SELECT
    country,
    SUM(score) AS total_scores
FROM customers
GROUP BY country
HAVING SUM(score) > 800
-- ONLY GROUPS PASSING THIS CONDITION APPEAR IN THE RESULT
```

#### DISTINCT

> `DISTINCT` REMOVES DUPLICATE ROWS FROM THE RESULT — EACH VALUE (OR COMBO) SHOWS ONCE.
>
> WRITE IT RIGHT AFTER `SELECT`. USE WHEN THE TABLE HAS REPEATED VALUES YOU DO NOT WANT TWICE.

```sql
-- EACH country LISTED ONCE (SKIP DUPLICATE country ROWS)
SELECT DISTINCT country
FROM customers

-- UNIQUE PAIRS: SAME id + country COMBO APPEARS ONLY ONCE
SELECT DISTINCT
    id,
    country
FROM customers
```

#### TOP / LIMIT

> LIMITS HOW MANY ROWS COME BACK — USEFUL FOR “TOP N” LISTS.
>
> `TOP` — SQL SERVER (GOES RIGHT AFTER `SELECT`). `LIMIT` — MYSQL, POSTGRESQL, SQLITE (GOES AT THE END, AFTER `ORDER BY`).
>
> SORT WITH `ORDER BY` FIRST SO YOU LIMIT THE ROWS YOU ACTUALLY WANT (E.G. HIGHEST SCORES).

```sql
-- SQL SERVER: TOP 3 CUSTOMERS BY score
SELECT TOP 3 *
FROM customers
ORDER BY score DESC
-- WITHOUT ORDER BY, "TOP 3" MAY BE ANY 3 ROWS

-- MYSQL / POSTGRESQL / SQLITE:
-- SELECT *
-- FROM customers
-- ORDER BY score DESC
-- LIMIT 3
```

#### CLAUSE MAP (WRITE vs EXECUTION)

> TWO ORDERS TO REMEMBER: **WRITE** = HOW YOU TYPE THE QUERY (TOP → BOTTOM). **EXECUTION** = HOW THE DATABASE PROCESSES IT (DIFFERENT FROM WRITE ORDER).

```text
┌─────────────────────────────────────────────────────────────────┐
│  WRITE ORDER          │  WHAT YOU TYPE (TOP → BOTTOM IN FILE)   │
├───────────────────────┼─────────────────────────────────────────┤
│  1. SELECT            │  columns, *, aggregates (COUNT, SUM...) │
│  2. DISTINCT          │  right after SELECT (optional)          │
│  3. TOP               │  SQL Server only — after SELECT         │
│  4. FROM              │  table name                             │
│  5. WHERE             │  filter rows                            │
│  6. GROUP BY          │  group rows                             │
│  7. HAVING            │  filter groups                          │
│  8. ORDER BY          │  sort result                            │
│  9. LIMIT             │  MySQL / PostgreSQL / SQLite — at end   │
└───────────────────────┴─────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│  EXECUTION ORDER      │  HOW THE DB RUNS IT (STEP BY STEP)      │
├───────────────────────┼─────────────────────────────────────────┤
│  1. FROM              │  load table                             │
│  2. WHERE             │  keep matching rows only                  │
│  3. GROUP BY          │  build groups                           │
│  4. HAVING            │  drop groups that fail condition          │
│  5. SELECT            │  pick columns + DISTINCT + aggregates   │
│  6. ORDER BY          │  sort rows                              │
│  7. TOP / LIMIT       │  return only first N rows                 │
└───────────────────────┴─────────────────────────────────────────┘

WRITE:   SELECT → DISTINCT → TOP → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT
EXECUTE: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → TOP/LIMIT
```

> **WHY IT MATTERS:** `WHERE` FILTERS ROWS BEFORE GROUPS EXIST. `HAVING` FILTERS AFTER. `ORDER BY` RUNS BEFORE `TOP`/`LIMIT` SO YOU CUT THE SORTED LIST, NOT RANDOM ROWS.

