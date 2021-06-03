#!/bin/bash 

count=${1}

csql -u dba testdb -c 'drop table if exists trun03;'

sleep 1

csql -u dba testdb -c 'create table trun03 (a char(5), b varchar(50));'

csql -u dba testdb -c "insert into trun03 values ('aaa', 'aaaaaaaaaaaaa')"
csql -u dba testdb -c "insert into trun03 values ('bbb', 'bbbbbbbbbbbbb')"
csql -u dba testdb -c "insert into trun03 values ('ccc', 'ccccccccccccc')" 

csql -u dba testdb -c "select count(*) from trun03"

csql -u dba testdb -c "truncate table trun03"

csql -u dba testdb -c "select count(*) from trun03"
