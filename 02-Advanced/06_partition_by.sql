/*
window_function(arg1, arg2, ...) OVER(
    [PARTITION BY partition_expresion]
    [ORDER BY sort_expression [ASC | DESC] [NULLS {FIRST | LAST}]]
)
Note:
    Partitioning changes the lens of calculations, to draw group conclusions.
*/

-- DB: Employees
SELECT
	CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME),
	S.SALARY,
	D.DEPT_NAME AS "Department",
	MIN(S.SALARY) OVER(
		PARTITION BY D.DEPT_NAME
	) AS "Min. Salary",
	MAX(S.SALARY) OVER(
		PARTITION BY D.DEPT_NAME
	) AS "Max. Salary",
	AVG(S.SALARY) OVER(
		PARTITION BY D.DEPT_NAME
	) AS "Avg. of Salary"
FROM SALARIES AS S
INNER JOIN EMPLOYEES AS E USING(EMP_NO)
INNER JOIN DEPT_EMP AS DE USING(EMP_NO)
INNER JOIN DEPARTMENTS AS D USING(DEPT_NO)
ORDER BY CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) ASC;

-- Use ORDER BY inside the window_function for framing
SELECT
	EMP_NO,
	COUNT(SALARY) OVER(
		ORDER BY EMP_NO		-- works like cumulative sum
	)
FROM SALARIES;

