/*
ANY/SOME:
    - Checks each row against the operator and if any/some comparison matches return true
ALL:
    - Opposite of ANY
*/
-- DB: Store
---- With ANY
SELECT
	P.PROD_ID,
	C.CATEGORYNAME
FROM PRODUCTS AS P
JOIN CATEGORIES AS C USING(CATEGORY)
WHERE CATEGORY = ANY (
	SELECT CATEGORY
	FROM CATEGORIES
	WHERE CATEGORYNAME IN ('Comdey', 'Family', 'Classics')
);

---- With SOME
SELECT
	P.PROD_ID,
	C.CATEGORYNAME
FROM PRODUCTS AS P
JOIN CATEGORIES AS C USING(CATEGORY)
WHERE CATEGORY = ANY (
	SELECT CATEGORY
	FROM CATEGORIES
	WHERE CATEGORYNAME IN ('Comdey', 'Family', 'Classics')
);

---- With ALL
SELECT
	P.PROD_ID,
	P.TITLE,
	C.CATEGORYNAME,
	I.SALES
FROM PRODUCTS AS P
JOIN CATEGORIES AS C USING(CATEGORY)
JOIN INVENTORY AS I ON I.PROD_ID = P.PROD_ID
WHERE I.SALES > ALL (
	SELECT AVG(SALES)
	FROM INVENTORY
	JOIN PRODUCTS AS P_SUB USING (PROD_ID)
	GROUP BY P_SUB.CATEGORY
);
