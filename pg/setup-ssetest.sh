#!/bin/sh -v
usr=ssetestusr
db=ssetest
dropdb $db
dropuser $usr
createuser $usr
createdb $db
psql -d $db < test-db.sql
psql -c "alter user $usr with password '$usr'";
psql -c "alter database $db owner to $usr";
psql -d $db -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $usr;";
