SELECT *
FROM EMPLOYEES
WHERE LAST_NAME LIKE 'M%';

/*
Note:
% = any number of characters
- = 1 character

Like works only with text, for other datatypes casting is needed:
- CAST(salary as text)
- salary::text
*/
-- with casting:

SELECT *
FROM EMPLOYEES
WHERE EMP_NO::text LIKE '1%2';

-- or
SELECT *
FROM EMPLOYEES
WHERE CAST(EMP_NO AS text) LIKE '1%2';

-- ilike: case insensitive like
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME ILIKE 'm%i%k';