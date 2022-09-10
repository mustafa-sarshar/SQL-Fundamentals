-- DATA TYPES:

/*
Boolean Type:
    - BOOLEAN:      # TRUE/FALSE
*/
/*
Character Type:
    - CHAR(N):      # fixed size with padding 
    - VARCHAR(N)    # fixed size without padding
    - TEXT          # unlimited size
*/
CREATE TABLE DATATYPE_CHAR(
	CH_FIXED CHAR(10),
	CH_VARIABLE VARCHAR(10),
	CH_UNLIMITED TEXT
);

INSERT INTO DATATYPE_CHAR VALUES(
	'ABCD',
	'ABCDEFGHID',
	'ABCDEFGHIDABCDEFGHIDABCDEFGHIDABCDEFGHIDABCDEFGHID'
);

/*
Numeric Type:
    - INTEGER
        - SMALLINT: # range from -32,768 to 32,767
        - INT:      # range from -2 million to 2 million
        - BIGINT:   # range from -9 billion to 2 billion
    - FLOAT
        - FLOAT4:   # single precision (6 digits)
        - FLOAT8:   # double precision (15 digits)
        - DECIMAL:  # up to 16383 decimal points
        - NUMBER:   # same as DECIMAL
*/
CREATE TABLE DATATYPE_NUMERIC(
	N_INT INT,
	N_FLOAT4 FLOAT4,
	N_FLOAT8 FLOAT8,
	N_BIG DECIMAL
);
INSERT INTO DATATYPE_NUMERIC VALUES(
	100,
	100.1239578234,
	100.123957823404582934,
	12030230130131313.001238108309183019831038108432859887892374
);

/*
ARRAY Type:
    - Note:
        - Array is a group of elements of the same type
        - Every data type in postgres has an array equivalent, simply by adding [] to the end of the data type
        - i.e. VARCHAR(N)[]
*/
CREATE TABLE DATATYPE_ARRAY(
	CH_OWNER VARCHAR(20),
	CH_CARS VARCHAR(15)[],
	CH_RECORDS INT[]
);
INSERT INTO DATATYPE_ARRAY VALUES(
	'Biggi Bugi',
	ARRAY['MERCEDES', 'FERRARI', 'BMW'],
	ARRAY[100, 200, 150, 400, 500]
);
/*
Date/Time Type:

*/

/*
UUID Type:

*/


-- Examples
