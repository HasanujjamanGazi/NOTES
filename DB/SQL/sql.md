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

> In every row there is a unique identifier & every cell can store one type of data.

#### DATA TYPES

> - NUMERIC  
>     - INT  
>     - DECIMAL  
>
> - STRING  
>     - CHAR (String with fixed width.)  
>     - VARCHAR (String with variable width)  
>
> - DATE & TIME  
>     - DATE  
>     - TIME

#### TYPES OF SQL COMM&S

> - DDL (Data Definition Language)  
>     - CREATE  
>     - ALTER  
>     - DROP  
>
> - DML (Data Manipulating Language)  
>     - INSERT  
>     - UPDATE  
>     - DELETE  
>
> - DQL (Data Query Language)  
>     - SELECT

#### COMMENTS & CONVENTIONS

> This is how we write comments in SQL.

```sql
-- This is single line comment.
/* 
This
is multiple 
line comment
*/
```

> In SQL write string values in single quotes (double quotes will cause error).

```sql
SELECT *
FROM customers
WHERE country = 'Germany'

-- If we write like this it will cause error.
WHERE country = "Germany"
```

#### QUERY DATA

> We Query from data base with `SELECT` to retrieve data. It basically means asking the proper questions to get need data.
>
> NOTE : Querying data does not modify anything in data base. So use query only to read data.
>
> #### CLAUSES
>
> Each SQL query have different sections named `clauses` like `SELECT` , `FROM`, `WHERE` etc.

> Query Data : Get the whole table.

```sql
-- It will return the whole table we selected.
SELECT *
FROM table_name
```

> Query Data : Get selected columns from the table.

```sql
-- Do not put after the end of the list of selected columns.
-- It will return the columns in the order we selected.
SELECT
    col_1,
    col_2,
    col_3
FROM table_name
```

#### WHERE
> We can use conditionals to get filtered data output with `WHERE`.

```sql
-- It will return only those rows where the condition is TRUE.
SELECT *
FROM table_name
WHERE condition
```

> Now we can combine `SELECT` & `WHERE` to get specific data.

```sql
-- It will return only the selected columns from the rows that satisfy the specified condition.
SELECT
    col_1,
    col_2
FROM table_name
where condition
```

#### SORTING

> We can sort our data in ascending/descending order with `ORDERBY`.

```sql
SELECT *
FROM table_name
ORDER BY col_2 DESC
-- By default ORDER BY sorts data in ascending order but specifying the order is convention.
```

> We can sort the table based on multiple columns. But the order of mentioning matters because the second sorting will only be performed if the first sorting have repetitions.

```sql
SELECT *
FROM customers
ORDER BY country ASC, score DESC
-- Here the sorting by score will only be performed if there is repeating values.
-- So the order of writing ORDER BY is important.
```

