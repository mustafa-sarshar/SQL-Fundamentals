-- The GROUP BY applies a SPLIT-APPLY-COMBINE strategy

-- DB: Employees
SELECT B.DEPT_NAME AS "Department", COUNT(A.EMP_NO) AS "No. of Employees"
FROM DEPT_EMP AS A
INNER JOIN DEPARTMENTS AS B
ON A.DEPT_NO = B.DEPT_NO
GROUP BY B.DEPT_NAME;

-- HAVING keyword: to filter groups
/*
SELECT col1, COUNT(col2)
FROM <table>
WHERE col2 > X
GROUP BY col1
HAVING col1 === Y;
*/

SELECT DEPT.DEPT_NO, DEPT.DEPT_NAME, COUNT(E.EMP_NO) AS "No. of Employees"
FROM EMPLOYEES AS E
INNER JOIN DEPT_EMP AS DE USING(EMP_NO)
INNER JOIN DEPARTMENTS AS DEPT ON DEPT.DEPT_NO = DE.DEPT_NO
WHERE E.GENDER = 'F'
GROUP BY DEPT.DEPT_NAME, DEPT.DEPT_NO
HAVING COUNT(E.EMP_NO) > 25000
