/*
window_function(arg1, arg2, ...) OVER(
    [PARTITION BY partition_expresion]
    [ORDER BY sort_expression [ASC | DESC] [NULLS {FIRST | LAST}]]
)
*/

-- DB: Store
SELECT
	*,
	MAX(TOTALAMOUNT) OVER() AS "MAX of Totalamount"  -- this will be applied against all rows
FROM ORDERS
WHERE TOTALAMOUNT < 300;

-- DB: Employees
SELECT
	*,
	AVG(SALARY) OVER() AS "Avg. of Salary"  -- this will be applied against all rows
FROM SALARIES;


SELECT
	D.DEPT_NAME AS "Department",
	AVG(S.SALARY) OVER() AS "Avg. of Salary"  -- this will be applied against all rows
FROM SALARIES AS S
INNER JOIN DEPT_EMP AS DE USING(EMP_NO)
INNER JOIN DEPARTMENTS AS D USING(DEPT_NO);