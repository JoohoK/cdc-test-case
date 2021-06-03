#!/bin/bash 

count=${1}

csql -u dba testdb -c 'drop table if exists ins01;'
csql -u dba testdb -c 'create table ins01 (id int);'

for (( i=0; i < $count; i++)); do
  csql -u dba testdb -c "insert into ins01 value ($i)" &> /dev/null
done

csql -u dba testdb -c "select count(*) from ins01"
