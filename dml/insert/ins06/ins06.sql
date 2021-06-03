#!/bin/bash 

csql -u dba testdb -c 'drop table if exists ins01;'
sleep 1

csql -u dba testdb -c 'create table ins01 (id int not null primary key);'

for (( i=0;i<2000; i++)); do
  csql -u dba testdb -c "insert into ins01 value ($i)" &> /dev/null
#  sleep 30
done

