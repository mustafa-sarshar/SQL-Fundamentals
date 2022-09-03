/* Source: https://www.w3schools.com/sql/sql_union.asp

The UNION operator is used to combine the result-set of two or more SELECT statements.
    - Every SELECT statement within UNION must have the same number of columns
    - The columns must also have similar data types
    - The columns in every SELECT statement must also be in the same order

SELECT column_name(s) FROM table1
UNION [ALL]
SELECT column_name(s) FROM table2;

Note:
The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL.

*/

SELECT NULL AS "prod_id", SUM(OL.QUANTITY)
FROM ORDERLINES AS OL

UNION ALL

SELECT PROD_ID AS "prod_id", SUM(OL.QUANTITY)
FROM ORDERLINES AS OL
GROUP BY PROD_ID
ORDER BY PROD_ID DESC;