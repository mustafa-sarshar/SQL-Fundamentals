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

-- Find no. of promotions and the max. salary of each employee
SELECT DISTINCT
	E.EMP_NO AS "EMP. ID",
	CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS "Full Name",
	D.DEPT_NAME AS "Department",
	COUNT(S.SALARY) OVER (
		PARTITION BY E.EMP_NO
	) AS "No. of Promotions",
	MAX(S.SALARY) OVER(
		PARTITION BY E.EMP_NO
	) AS "Max. Salary"
FROM SALARIES AS S
INNER JOIN EMPLOYEES AS E USING(EMP_NO)
INNER JOIN DEPT_EMP AS DE USING(EMP_NO)
INNER JOIN DEPARTMENTS AS D USING(DEPT_NO)
ORDER BY E.EMP_NO;

-- Use ORDER BY inside the window_function for framing
SELECT
	EMP_NO,
	COUNT(SALARY) OVER(
		ORDER BY EMP_NO		-- works like cumulative sum
	)
FROM SALARIES;
-- Or
SELECT
	EMP_NO,
	COUNT(SALARY) OVER w1
FROM SALARIES
WINDOW w1 as (
	ORDER BY EMP_NO
);