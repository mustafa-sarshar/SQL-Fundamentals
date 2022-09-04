/*
Subquery:
- It is a construct that allows us to build extremely complex queries.
- It is also called an INNER Query or INNER SELECT.
- Most often found in the WHERE clause.
- It can be used in SELECT, FROM and HAVING clauses.
- It must be enclosed in parentheses.
- Must be placed on the RIGHT hand side of the COMPARISON OPERATOR
- Subqueries that return NULL may not return results

- In WHERE clause:
SELECT *
FROM <table>
WHERE <column> <condition> (
    SELECT <col1>, <col2>, ...
    FROM <table>
    [ WHERE | GROUP BY | ... ]
);

- In SELECT clause:
SELECT (
    SELECT <col1>, <col2>, ...          -- Must return a single record
    FROM <table>
    [ WHERE | GROUP BY | ... ]
)
FROM <table>
WHERE <column> <condition>;

- In FROM clause:
SELECT *
FROM (
    SELECT <col1>, <col2>, ...          -- Must return only one value
    FROM <table>
    [ WHERE | GROUP BY | ... ]
) AS <name>
WHERE <column> <condition>;

- In HAVING clause:
SELECT *
FROM <table> as <name>
GROUP BY <column>
HAVING (
    SELECT <col1>, <col2>, ...          -- Must return only one value
    FROM <table>
    [ WHERE | GROUP BY | ... ]
) > X;
*/

-- DB: Store
-- Subquery for SELECT clause
SELECT
	TITLE,
	PRICE,
	(
		SELECT
			AVG(PRICE)
		FROM PRODUCTS
	) AS "Avg. Price"
FROM PRODUCTS;

-- Subquery for both SELECT and FROM clauses
SELECT
	TITLE,
	PRICE,
	(
		SELECT
			AVG(PRICE)
		FROM PRODUCTS
	) AS "Avg. Price"
FROM (
	SELECT *
	FROM PRODUCTS
	WHERE PRICE > 10
) AS "products_sub";

-- Subquery for WHERE clause
SELECT
	TITLE,
	PRICE
FROM PRODUCTS
WHERE PRICE > (
	SELECT
		MAX(PRICE)
	FROM PRODUCTS
	WHERE PRICE < 10
);