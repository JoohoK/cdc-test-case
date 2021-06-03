csql -u dba apidb -c "drop table if exists api04a "
csql -u dba apidb -c "drop table if exists api04b "
csql -u dba apidb -c "drop table if exists api04c "
sleep 1

csql -u dba apidb -c "create table api04a (a int)"
csql -u dba apidb -c "create table api04b (a int)"
csql -u dba apidb -c "create table api04c (a int)"
