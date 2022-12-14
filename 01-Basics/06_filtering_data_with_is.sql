/*
SELECT * FROM <table>
WHERE <field> = '' IS NOT FALSE;
*/

SELECT * FROM CUSTOMERS
WHERE ADDRESS2 IS NOT NULL;

SELECT * FROM CUSTOMERS
WHERE STATE = 'NY' IS TRUE;

SELECT * FROM CUSTOMERS
WHERE STATE = 'NY' IS NOT FALSE;

SELECT FIRSTNAME, LASTNAME, AGE FROM CUSTOMERS
WHERE AGE < 25 IS TRUE;