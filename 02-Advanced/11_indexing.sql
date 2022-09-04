/*
Types of INDEX:
- SINGLE-COLUMN     (most frequently used column in a query)
- MULTI-COLUMN      (most frequently used columns in a query)
- UNIQUE            (for speed and integrity, i.e. primary key)
- PARTIAL           (for a subset of a table)
- IMPLICIT INDEXES  (automatically created by the Database, primary key and unique key)

When to use INDEX:
- Foreign keys
- Primary keys and unique columns
- Columns that end up in the ORDER BY or WHERE clause often

When NOT to use INDEX:
- Small tables
- Tables that are updated frequently
- Columns that can contain NULL values
- Columns that have large values
*/

-- Create an INDEX:
/*
CREATE UNIQUE INDEX <name>
ON <table> USING <method> (col1, col2, ...);
*/
-- Remove an INDEX:
/*
DROP INDEX <name>;
*/

-- Examples:
-- DB: World

CREATE INDEX IDX_COUNTRYCODE
ON CITY(COUNTRYCODE);

EXPLAIN ANALYSE
SELECT
	*
FROM CITY
WHERE COUNTRYCODE IN ('BEL', 'TUN', 'NLD');

-- Partial INDEX:
CREATE INDEX IDX_COUNTRYCODE
ON CITY(COUNTRYCODE)
WHERE COUNTRYCODE IN ('BEL', 'TUN', 'NLD');

/*
Methods of indexing provided by Postgres:
- B-TREE            (default algorithm, best used for comparisons)
- HASH              (can only handle the equality (=) operations)
- GIN               (Generalized Inverted Index, best used when multiple values are stored in a single field)
- GIST              (Generalized Search Tree, best used in indexing geometric data and full-text search)
*/

-- Using HASH method
CREATE INDEX IDX_COUNTRYCODE_HASH
ON CITY USING HASH (COUNTRYCODE)
WHERE COUNTRYCODE = 'BEL' OR COUNTRYCODE = 'TUN' OR COUNTRYCODE = 'NLD';