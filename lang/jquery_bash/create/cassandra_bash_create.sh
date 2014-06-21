#! /bin/bash
#
#	cassandra_bash_create.sh
#
#					Sep/03/2013
#
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
export PATH=$PATH:/home/uchida/dbm/cassandra/apache-cassandra-1.2.9/bin
WORK_FILE="/tmp/tmp00751.txt"
#
rm -f $WORK_FILE
#
echo "Content-type: text/html"
echo ""
echo ""
#
cho "drop keyspace city;" > $WORK_FILE
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
record_gen_proc t0531 秋田 82300 2001-9-11
record_gen_proc t0532 男鹿 75100 2001-3-27
record_gen_proc t0533 由利本荘 72400 2001-4-9
record_gen_proc t0534 横手 95800 2001-2-12
record_gen_proc t0535 鹿角 42600 2001-10-23
record_gen_proc t0536 大館 27800 2001-11-8
record_gen_proc t0537 能代 81200 2001-8-17
record_gen_proc t0538 にかほ 53600 2001-7-26
record_gen_proc t0539 湯沢 31700 2001-2-18
#
#
echo "quit;" >> $WORK_FILE
#
echo "*** check *** cassandra ***<br />"
#
cqlsh < $WORK_FILE
#
rm -f $WORK_FILE
#
echo "*** OK *** Sep/03/2013 ***<br />"
#
