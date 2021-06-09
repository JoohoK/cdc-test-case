csql -u dba testdb -c " drop table if exists api06"
sleep 1
csql -u dba testdb -c " create table api06 (a int, b int, primary key (a, b))"
csql -u dba testdb -c "insert into api06 values (1,2)"
csql -u dba testdb -c "insert into api06 values (3,4)"
csql -u dba testdb -c "insert into api06 values (5,6)"
csql -u dba testdb -c "insert into api06 values (7,8)"
csql -u dba testdb -c "delete from api06"
