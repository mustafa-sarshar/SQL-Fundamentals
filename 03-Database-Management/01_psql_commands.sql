-- Activate the user and use the shell
---- $ sudo su postgres
-------- $ psql
---- $ sudo -u postgres psql <database_name>

-- Some useful commands
---- \copyright         # for distribution terms
---- \h                 # for help with SQL commands
---- \?                 # for help with psql commands
---- \g or terminate with semicolon         # to execute query
---- \q                 # to quit
---- \l                 # show all databases
---- \c <db_name>       # switching databases
---- \dt                # listing all tables
---- \dn                # show all schemas
---- \du                # list of roles
---- \conninfo          # get info about the database
---- \d <table_name>    # get info about the table
---- \i <file.sql>      # run the sql file using relative or absolute path

-- CREATE extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";     -- Universally Unique Identifier
-- or
CREATE EXTENSION "uuid-ossp";
-- List all Extensions
SELECT * FROM pg_available_extensions;