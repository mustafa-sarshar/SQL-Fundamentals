/*
Source: https://www.longdom.org/open-access/on-the-paramount-importance-of-database-constraints-2165-7866-1000e125.pdf
Constaints are a tool to apply validation methods to data that will be inserted.

Constraints are:
    1- Column Constraints
        - NOT NULL          - cannot be NULL
        - PRIMARY KEY       - the column will be the primary key
        - UNIQUE            - can only have UNIQUE values (NULL is UNIQUE)
        - CHECK             - apply a special condition check to column values
        - REFERENCES        - constrain the values of the column to only be the values that exist in the column of another table (= Foreign Key)
    2- Table Constraints
        - UNIQUE(column_list)
        - PRIMARY KEY(column_list)
        - CHECK(condition)
        - REFERENCES
*/
-- Example 1 (Column Constraints)
CREATE TABLE user (
    user_id UUID DEFAULT UUID_GENERATE_V4(),
    user_password VARCHAR(25) NOT NULL,
    CONSTRAINT pk_user_id PRIMARY KEY (user_id)
)

-- Example 2 (Column Constraints AND Table Constraints)
CREATE TABLE CATEGORY(
	CAT_ID SMALLINT PRIMARY KEY,
	CAT_TYPE TEXT
);
CREATE TABLE COLUMN_CONSTRAINTS (
	CC_ID SMALLINT PRIMARY KEY,
	CC_DESCRIPTION TEXT NOT NULL,
	CC_EMAIL TEXT CHECK(CC_EMAIL ~ * '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
	CAT_ID SMALLINT REFERENCES CATEGORY(CAT_ID)
);
CREATE TABLE TABLE_CONSTRAINTS (
	TC_ID SMALLINT,
	TC_DESCRIPTION TEXT NOT NULL,
	TC_EMIAL TEXT,
	CAT_ID SMALLINT REFERENCES CATEGORY(CAT_ID),
	CONSTRAINT PK_TC_ID PRIMARY KEY (TC_ID),
	CONSTRAINT CHECK_EMAIL CHECK (TC_EMIAL ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);