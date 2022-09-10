- Priviledges
---- LOGIN PRIVILEDGE
---- SUPERUSER STATUS
---- DATABASE CREATION
---- ROLE CREATION
---- PASSWORD
-- Create a Role
CREATE ROLE <role>;
CREATE ROLE readonly WITH LOGIN ENCRYPTED PASSWORD 'readonly';      -- always encrypt when storing a role that can log in


-- CREATEUSER command
---- $ createuser --interactive

-- Config files
---- pg_hba.conf            # get the address in psql: show hba_file;       # for login interactions
---- postgres.conf          # get the address in psql: show config_file;    # 


-- GRANT Priviledges
GRANT ALL PRIVILEDGES ON <table> TO <user>;
GRANT ALL ON ALL TABLES [ IN SCHEMA <schema> ] TO <user>;
GRANT [ SELECT, UPDATE, INSERT, ... ] ON <table> [ IN SCHEMA <schema> ] TO <user>;
GRANT ALL ON ALL TABLES IN SCHEMA <schema> TO <priviledge>;
GRANT <role> TO <priviledge>;

-- REVOKE Priviledges
REVOKE [ SELECT, UPDATE, INSERT, ... ] ON <table> [ IN SCHEMA <schema> ] FROM <user>;
REVOKE <role> FROM <priviledge>;