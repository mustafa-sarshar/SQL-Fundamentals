-- select statement to filter Mayumi Schueller
SELECT FIRST_NAME,
	LAST_NAME
FROM EMPLOYEES
-- filter on first and last name to focus on a signle person
WHERE CONCAT(FIRST_NAME, ' ', LAST_NAME) = 'Mayumi Schueller';