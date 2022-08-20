SELECT A.EMP_NO, CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS "Name", B.SALARY
FROM EMPLOYEES AS A, SALARIES AS B
WHERE A.EMP_NO = B.EMP_NO;

-- By using INNER JOIN
SELECT A.EMP_NO, CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS "Name", B.SALARY
FROM EMPLOYEES AS A
INNER JOIN SALARIES AS B
ON B.EMP_NO = A.EMP_NO
ORDER BY A.EMP_NO ASC;

-- 3 Tables via INNER JOIN
-- To find which employees has got promotion
SELECT  A.EMP_NO,
        CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS "Name",
        B.SALARY,
        C.TITLE,
        C.FROM_DATE AS "Promoted on"
FROM EMPLOYEES AS A
INNER JOIN SALARIES AS B
    ON B.EMP_NO = A.EMP_NO
INNER JOIN TITLES AS C
    ON C.EMP_NO = A.EMP_NO
    AND (
        C.FROM_DATE = (B.FROM_DATE + INTERVAL '2 days')
        OR C.FROM_DATE = B.FROM_DATE
    )
ORDER BY A.EMP_NO ASC;

-- SELF JOIN
SELECT A.ID, A.NAME AS "Employee", B.NAME AS "Supervisor"
FROM EMPLOYEES AS A, EMPLOYEES AS B
WHERE A.SUPERVISORID = B.ID;

-- OUTER JOIN
--- LEFT OUTER JOIN
--- RIGHT OUTER JOIN:   adds the data that don't have a match from table B (basically it is the inverse of the LEFT OUTER JOIN)
/*
SELECT *
FROM <table A> as A
LEFT/RIGHT [OUTER] JOIN <table B> as B
ON A.ID = B.ID;
*/
-- Find how manay employees are not manager
SELECT COUNT(EMP.EMP_NO)
FROM EMPLOYEES AS EMP
LEFT OUTER JOIN DEPT_MANAGER AS DEP
ON EMP.EMP_NO = DEP.EMP_NO
WHERE DEP.EMP_NO IS NULL;

-- To find every salary raise and also know which one were a promotion
SELECT  A.EMP_NO,
        CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS "Name",
        B.SALARY,
        COALESCE(C.TITLE, 'Not Title Change') AS "Title"
FROM EMPLOYEES AS A
INNER JOIN SALARIES AS B
    ON B.EMP_NO = A.EMP_NO
LEFT JOIN TITLES AS C
    ON C.EMP_NO = A.EMP_NO
    AND (
        C.FROM_DATE = (B.FROM_DATE + INTERVAL '2 days')
        OR C.FROM_DATE = B.FROM_DATE
    )
ORDER BY A.EMP_NO ASC;

-- CROSS JOIN: creates a combination of every row
-- DB: Employees
CREATE TABLE "cartesianA" ( ID INT );
CREATE TABLE "cartesianB" ( ID INT );

INSERT INTO "cartesianA" VALUES (1);
INSERT INTO "cartesianA" VALUES (2);
INSERT INTO "cartesianA" VALUES (3);
INSERT INTO "cartesianA" VALUES (4);
INSERT INTO "cartesianA" VALUES (5);

INSERT INTO "cartesianB" VALUES (1);
INSERT INTO "cartesianB" VALUES (2);
INSERT INTO "cartesianB" VALUES (3);
INSERT INTO "cartesianB" VALUES (20);
INSERT INTO "cartesianB" VALUES (30);

SELECT
    A.ID AS "A_ID",
    B.ID AS "B_ID"
FROM "cartesianA" AS A
CROSS JOIN "cartesianB" AS B;

-- FULL OUTER JOIN:     returns results from both whether they match or not
SELECT
    A.ID AS "A_ID",
    B.ID AS "B_ID"
FROM "cartesianA" AS A
FULL JOIN "cartesianB" AS B
ON A.ID = B.ID;

-- USING: to simplify the JOIN syntax
--- It can be used instead of ON keyword when the column name of both tables has the same name.
SELECT CONCAT(EMP.FIRST_NAME, ' ', EMP.LAST_NAME) AS "Employee", DEPS.DEPT_NAME AS "Department"
FROM EMPLOYEES AS EMP
INNER JOIN DEPT_EMP AS DEMP USING(EMP_NO)           -- instead of writing: ON EMP.EMP_NO = DEMP.EMP_NO
INNER JOIN DEPARTMENTS AS DEPS USING(DEPT_NO)       -- instead of writing: ON DEMP.DEPT_NO = DEPS.DEPT_NO
WHERE DEPS.DEPT_NAME ILIKE 'c%' OR DEPS.DEPT_NAME ILIKE 'h%'
ORDER BY DEPS.DEPT_NAME DESC
