#!/bin/bash 

count=${1}

csql -u dba testdb -c 'drop table if exists trun05;'
sleep 1;

csql -u dba testdb -c 'create table trun05 (a TIME, b DATE, c DATETIME);'

csql -u dba testdb -c "insert into trun05 values (time'13:00:32', date'02/28/2021', datetime'12:30:30 02/28/2021')"
csql -u dba testdb -c "insert into trun05 values (time'14:00:42', date'03/28/2021', datetime'12:30:30 03/28/2021 ')"
csql -u dba testdb -c "insert into trun05 values (time'15:00:52', date'04/28/2021', datetime'12:30:30 04/28/2021 ')"

csql -u dba testdb -c "select count(*) from trun05"

csql -u dba testdb -c "truncate table trun05"

csql -u dba testdb -c "select count(*) from trun05"
