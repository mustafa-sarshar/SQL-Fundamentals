-- Activate the user and use the shell
---- $ sudo su postgres
---- $ psql

-- Some useful commands
---- \l             # show all databases
---- \dn            # show all schemas
---- \du            # list of roles



-- Template Database


-- Creat a Database
-- CREATE DATABASE <database_name>;
CREATE DATABASE testDB;

-- Drop a Database
-- DROP DATABASE <database_name>;
DROP DATABASE testDB;


-- Create a Schema              # it allows multiple users to use same database without interfering with each other
CREATE SCHEMA schema1;

-- Create a Role
CREATE ROLE readonly WITH LOGIN ENCRYPTED PASSWORD 'readonly';      -- always encrypt when storing a role that can log in

