-- Activate the user and use the shell
---- $ sudo su postgres
-------- $ psql
---- $ sudo -u postgres psql <database_name>

-- Some useful commands
---- \l                 # show all databases
---- \c                 # switching databases
---- \dt                # listing all tables
---- \dn                # show all schemas
---- \du                # list of roles
---- \conninfo          # get info about the database
---- \d <table_name>    # get info about the table

-- CREATE extensions
CREATE EXTENSION IF NOT EXISTS "uuid_ossp";
-- or
CREATE EXTENSION "uuid_ossp";