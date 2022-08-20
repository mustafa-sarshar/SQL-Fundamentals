/*
SELECT coalesce(<column>, 'Empty') AS column_alias
FROM <table>

or 

SELECT coalesce(
    <column1>,
    <column2>,
    <column3>,
     'Empty') AS column_alias
FROM <table>
*/

-- Substitutes the null values of the price column with -1
SELECT TITLE, COALESCE(PRICE, -1) FROM PRODUCTS;