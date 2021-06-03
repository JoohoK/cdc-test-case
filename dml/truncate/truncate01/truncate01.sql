#!/bin/bash 

count=${1}

csql -u dba testdb -c 'drop table if exists trun01;'

sleep 1

csql -u dba testdb -c 'create table trun01 (id int);'

for (( i=0; i < $count; i++)); do
  csql -u dba testdb -c "insert into trun01 value ($i)" &> /dev/null
done

csql -u dba testdb -c "select count(*) from trun01"

csql -u dba testdb -c "truncate table trun01"

csql -u dba testdb -c "select count(*) from trun01"
