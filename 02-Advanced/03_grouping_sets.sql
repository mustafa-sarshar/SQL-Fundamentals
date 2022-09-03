/*
GROUPING SETS allows to combine the output of multiple groupings, similar to what UNION can do.
*/

-- SELECT NULL AS "prod_id", SUM(OL.QUANTITY)
-- FROM ORDERLINES AS OL
-- UNION ALL

SELECT PROD_ID AS "prod_id", ORDERLINEID, SUM(OL.QUANTITY)
FROM ORDERLINES AS OL
GROUP BY
	GROUPING SETS(
		(),			-- nothing
		(PROD_ID),
		(ORDERLINEID)
	)
ORDER BY PROD_ID DESC, ORDERLINEID DESC;



-- A more complex example
SELECT
	EXTRACT(YEAR FROM ORDERDATE) AS "Year",
	EXTRACT(MONTH FROM ORDERDATE) AS "Month",
	EXTRACT(DAY FROM ORDERDATE) AS "Day",
	SUM(OL.QUANTITY)
FROM ORDERLINES AS OL
GROUP BY
	GROUPING SETS(
		(
			EXTRACT(YEAR FROM ORDERDATE)
		),
		(
			EXTRACT(YEAR FROM ORDERDATE),
			EXTRACT(MONTH FROM ORDERDATE)
		),
		(
			EXTRACT(YEAR FROM ORDERDATE),
			EXTRACT(MONTH FROM ORDERDATE),
			EXTRACT(DAY FROM ORDERDATE)
		),
		(
			EXTRACT(MONTH FROM ORDERDATE),
			EXTRACT(DAY FROM ORDERDATE)
		),
		(
			EXTRACT(MONTH FROM ORDERDATE)
		),
		(
			EXTRACT(DAY FROM ORDERDATE)
		),
		()				-- total
	)
ORDER BY
	EXTRACT(YEAR FROM ORDERDATE),
	EXTRACT(MONTH FROM ORDERDATE),
	EXTRACT(DAY FROM ORDERDATE);