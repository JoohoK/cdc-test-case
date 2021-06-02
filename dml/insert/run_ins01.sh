#!/bin/bash

host=${1}
port=${2}
dbname=${3}
extraction_count=${4}

start_time=${1}
extraction_count=${2}
max_log_item=${3}

gcc -g -o extract001 -I$CUBRID/include -L$CUBRID/lib -lcubridcs dml001.c

./extract001 $start_time $extraction_count $max_log_item 
