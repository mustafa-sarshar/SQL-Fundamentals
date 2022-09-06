/*
Subquery:
- It is a construct that allows us to build extremely complex queries.
- It is also called an INNER Query or INNER SELECT.
- Most often found in the WHERE clause.
- It can be used in SELECT, FROM and HAVING clauses.
- It must be enclosed in parentheses.
- Must be placed on the RIGHT hand side of the COMPARISON OPERATOR
- Subqueries that return NULL may not return results
*/

/*
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


-- Subquery for SELECT clause
---- DB: Store
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

/*
Types of Subqueries:
- Single Row            (returns zero or one row)
- Multiple Row          (returns one or more rows)
- Multiple Column       (returns one or more columns)
- Correlated            (reference one or more columns in the outer statement - runs against each row)
- Nested                (subquery in a subquery)
*/

-- Single Row
---- DB: Employees
SELECT
	EMP_NO,
	SALARY
FROM SALARIES
WHERE SALARY > (
	SELECT AVG(SALARY) FROM SALARIES
);

-- Multiple Rows
---- DB: Store
SELECT
	TITLE,
	PRICE,
	CATEGORY
FROM PRODUCTS
WHERE CATEGORY in (
	SELECT CATEGORY
	FROM CATEGORIES
	WHERE CATEGORYNAME in ('Comdey', 'Family', 'Classic')
);
-- Which is eqal to:
SELECT
	P.TITLE,
	P.PRICE,
	P.CATEGORY
FROM PRODUCTS AS P
INNER JOIN CATEGORIES AS C USING(CATEGORY)
WHERE C.CATEGORYNAME in ('Comdey', 'Family', 'Classic');

-- Multiple Columns
---- DB: Employees
SELECT
	S.EMP_NO,
	S.SALARY,
	DE_SUB.AVG AS "Department Avg. Salary"
FROM SALARIES AS S
JOIN DEPT_EMP AS DE USING(EMP_NO)
JOIN(
	SELECT
		DEPT_NO, AVG(SALARY)
	FROM SALARIES AS S_SUB
	JOIN DEPT_EMP AS DE_SUB USING(EMP_NO)
	GROUP BY DEPT_NO
) AS DE_SUB USING(DEPT_NO)
WHERE S.SALARY > DE_SUB.AVG;

-- Correlated
---- DB: Employees
SELECT
	S.EMP_NO,
	S.SALARY,
	S.FROM_DATE
FROM SALARIES AS S
WHERE S.FROM_DATE = (
	SELECT MAX(S2.FROM_DATE) AS SALARY_MAX
	FROM SALARIES AS S2
	WHERE S2.EMP_NO = S.EMP_NO
)
ORDER BY EMP_NO;

-- Nested
---- DB: Store
SELECT
	ORDERLINEID,
	PROD_ID,
	QUANTITY
FROM ORDERLINES
JOIN (
	SELECT
		PROD_ID
	FROM PRODUCTS
	WHERE CATEGORY in (
		SELECT CATEGORY
		FROM CATEGORIES
		WHERE CATEGORYNAME in ('Comdey', 'Family', 'Classics')
	)
) AS LIMITED USING (PROD_ID);




-- Other Examples
---- DB: Employees (male employees older than the average age of males)