-- DB: Employees
SELECT DISTINCT
	CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS "emp. name",
	COUNT(S.SALARY) OVER (PARTITION BY E.EMP_NO) as "# of promotions",
	CASE
		WHEN COUNT(S.SALARY) OVER (PARTITION BY E.EMP_NO) > 10 THEN 'too much'
		WHEN COUNT(S.SALARY) OVER (PARTITION BY E.EMP_NO) > 3 THEN 'normal'
		WHEN COUNT(S.SALARY) OVER (PARTITION BY E.EMP_NO) <= 3 THEN 'ok'
	END AS "salary changed"
FROM EMPLOYEES AS E
INNER JOIN SALARIES AS S USING(EMP_NO);