/*
*/

CREATE DOMAIN AGE_YOUNG SMALLINT CHECK (VALUE > 17 AND VALUE <= 35);
CREATE TYPE CLUB_MEMBERS AS (
	MEMBER_ID UUID,
	MEMBER_AGE AGE_YOUNG,
	MEMBER_BIO TEXT
);