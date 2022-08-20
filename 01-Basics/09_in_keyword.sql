/*
SELECT * FROM <table>
WHERE <column> IN (value1, value2, ...)
*/

SELECT *
FROM EMPLOYEES
WHERE EMP_NO in (10001, 10005, 100010);