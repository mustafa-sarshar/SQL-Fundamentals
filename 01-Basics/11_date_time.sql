SHOW TIMEZONE;
SHOW TIME ZONE;

SET TIME ZONE 'UTC';

/*
Note:
Postgres uses UTC time standard
and it uses ISO-8601 time format
YYYY-MM-DDTHH:MM:SS+GMT time offset
2022-08-12T12:33:23+02:00
*/

-- TIMESTAMPS
SELECT NOW();

-- Create a new table for timestamp in Employees
CREATE TABLE TIMEZONES (
    TS TIMESTAMP WITHOUT TIME ZONE,
    TZ TIMESTAMP WITH TIME ZONE
)

INSERT INTO TIMEZONES VALUES (
    TIMESTAMP WITHOUT TIME ZONE '2000-01-01 10:00:00-05',
    TIMESTAMP WITH TIME ZONE '2000-01-01 10:00:00-05'
)

SELECT * FROM TIMEZONES;

-- Date operators
SELECT NOW()::date;
SELECT CURRENT_DATE;

-- Formating date       Source: https://www.postgresql.org/docs/current/functions-formatting.html
SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/yy');

-- Calculate Age
SELECT AGE(date '2000-01-01');
SELECT AGE(date '2000-01-01', date '2021-01-01');

-- Extract data from Date object
SELECT EXTRACT (DAY FROM CURRENT_DATE);
SELECT EXTRACT (MONTH FROM CURRENT_DATE) AS MONTH;
SELECT EXTRACT (YEAR FROM BIRTH_DATE) AS MONTH FROM EMPLOYEES;

-- Round date
SELECT DATE_TRUNC('year', date '2022-02-01') AS "Year rounded";

-- adjusting INTERVALs
SELECT *
FROM ORDERS
WHERE ORDERDATE <= NOW() - INTERVAL '30 days';      -- to get any order taken till 30 days ago

SELECT *
FROM ORDERS
WHERE ORDERDATE <= NOW() - INTERVAL '18 years 5 months 5 days 20 hours';

-- combine EXTRACT with INTERVAL
SELECT EXTRACT(
    'year'
    FROM
        INTERVAL '18 years 20 months'
);
