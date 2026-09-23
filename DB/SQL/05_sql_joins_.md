### JOINS

> We do joins for mainly 3 reasons
> 
> - Recombine Data.
> 
> - Data Enrichment.
> 
> - Check Existence (Filtering).

> We have different types of joins

#### NO JOINS

> Actually it does not join at all it just show the two table.

```sql
SELECT *
FROM customers

SELECT *
FROM orders
```

#### INNER JOINS

> Join only the matching data.

```sql
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
```

#### LEFT JOIN

> All of left table & only matching from right table.

```sql
SELECT
	c.id,
	c.first_name,
	c.score,
	o.order_id,
	o.order_date,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
```

#### RIGHT JOIN

> All of right table & only matching from left table.

```sql
SELECT
	c.id,
	c.first_name,
	c.score,
	o.order_id,
	o.order_date,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
```

#### FULL JOIN

> All the data from both of the table

```sql
SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.order_date,
	o.sales
FROM orders AS o
FULL JOIN customers AS c
ON c.id = o.customer_id
```

