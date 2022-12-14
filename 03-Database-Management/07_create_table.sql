/*
Source: https://www.postgresql.org/docs/12/sql-createtable.html

CREATE TABLE <name> (
    <col1> <type> [ <constraint> ],
    <table_constraint> [ <constraint> ]
) [ INHERITS <existing_table> ];
*/

CREATE TABLE CUSTOMTABLE_1(
	USER_ID UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
	USER_NAME VARCHAR(20) NOT NULL,
	USER_EMAIL VARCHAR(255) NOT NULL,
	USER_BITHDATE date NOT NULL
);

-- Temporary Tables         # These types of tables will be dropped at the end of your session and they are only visible to the creator.
CREATE TEMPORARY TABLE <table_name> (
    -- the columns
);

-- Update a Table or Column
/*
ALTER TABLE [IF EXISTS] [ONLY] NAME [*]
	ADD COLUMN <col_name> <data_type> <constraint>
	-- or --
	ALTER COLUMN <col_name> TYPE <new_type> [USING <expression>]
	-- or --
	ALTER VOLUMN <col_name> SET NOT NULL
	-- or --
	RENAME COLUMN <current_name> TO <new_name>
	-- or --
	DROP COLUMN <col_name> [RESTRICT | CASCADE]
*/