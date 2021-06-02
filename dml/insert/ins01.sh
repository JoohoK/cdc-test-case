#!/bin/bash 

count=${1}

csql -u dba testdb -c 'drop table if exists test001;'
csql -u dba testdb -c 'create table test001 (id int);'

for (( i=0; i < $count; i++)); do
  csql -u dba testdb -c "insert into test001 value ($i)"
done
