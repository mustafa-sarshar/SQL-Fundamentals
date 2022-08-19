SELECT FIRST_NAME, BIRTH_DATE, HIRE_DATE
FROM EMPLOYEES
WHERE GENDER = 'F'
AND BIRTH_DATE > '1950-01-01';

SELECT *
FROM EMPLOYEES
WHERE GENDER = 'F'
AND BIRTH_DATE > '1950-01-01'
AND NOT LAST_NAME = 'Simmel';

SELECT COUNT(FIRST_NAME)
FROM EMPLOYEES
WHERE NOT BIRTH_DATE < '1959-12-03'
AND NOT BIRTH_DATE > '1960-12-03';

-- Notes:
-- Comparison operators: https://www.postgresql.org/docs/12/functions-comparison.html