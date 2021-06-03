#!/bin/bash

host=${1}
port=${2}
dbname=${3}
extraction_count=${4}

indent -l120 -lc120 cubrid_log_connect_server.c
indent -l120 -lc120 cubrid_log_set_function.c
indent -l120 -lc120 cubrid_log_find_lsa.c
indent -l120 -lc120 cubrid_log_extract.c

gcc -g -o cubrid_log_connect_server -I$CUBRID/include -L$CUBRID/lib -lcubridcs cubrid_log_connect_server.c
gcc -g -o cubrid_log_set_function -I$CUBRID/include -L$CUBRID/lib -lcubridcs cubrid_log_set_function.c
gcc -g -o cubrid_log_find_lsa -I$CUBRID/include -L$CUBRID/lib -lcubridcs cubrid_log_find_lsa.c
gcc -g -o cubrid_log_extract -I$CUBRID/include -L$CUBRID/lib -lcubridcs cubrid_log_extract.c

#./cubrid_log_connect_server $host $port $dbname
#./cubrid_log_set_function $host $port $dbname
#./cubrid_log_find_lsa $host $port $dbname
./cubrid_log_extract $host $port $dbname $extraction_count 
