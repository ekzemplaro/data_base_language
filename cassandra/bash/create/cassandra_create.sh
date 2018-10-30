#! /bin/bash
#
#	cassandra_create.sh
#
#						Oct/21/2018
#
WORK_FILE="/tmp/tmp0051.txt"
#
# ----------------------------------------------------------------
function record_gen_proc
{
key_in=$1
name_in=$2
population_in=$3
date_mod=$4
echo "insert into cities (key,name,population,date_mod)
                values ('$key_in','$name_in',$population_in,'$date_mod');" >> $WORK_FILE
#
}

# ----------------------------------------------------------------
echo "*** 開始 ***"
#
rm -f $WORK_FILE
#
echo "drop keyspace city;" > $WORK_FILE
#
echo "create keyspace city with replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };" >> $WORK_FILE
echo "use city;" >> $WORK_FILE
echo "create table cities (
        key varchar primary key,
        name text,
        population int,
        date_mod timestamp
);" >> $WORK_FILE
#
record_gen_proc t0531 秋田 97126 2001-8-12
record_gen_proc t0532 男鹿 28657 2001-6-27
record_gen_proc t0533 由利本荘 72416 2001-4-9
record_gen_proc t0534 横手 95128 2001-2-12
record_gen_proc t0535 鹿角 42761 2001-10-23
record_gen_proc t0536 大館 25613 2001-11-8
record_gen_proc t0537 能代 81257 2001-8-17
record_gen_proc t0538 にかほ 53412 2001-7-21
record_gen_proc t0539 湯沢 41576 2001-4-16
#
echo "quit;" >> $WORK_FILE
#
echo "*** pppp ***"
#
cqlsh < $WORK_FILE
#
rm -f $WORK_FILE
#
echo "*** 終了 ***"
# ----------------------------------------------------------------
