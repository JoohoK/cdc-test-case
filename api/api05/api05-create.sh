csql -u dba apidb -c " CREATE USER joo GROUPS dba"

csql -u public apidb -c "create table api04a (a int)"
csql -u joo apidb -c "create table api04b (a int)"
csql -u dba apidb -c "create table api04c (a int)"
