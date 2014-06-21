#! /bin/bash
#
#	voltdb_update.sh
#					Jan/30/2012
#
VOLTDB=/home/uchida/dbm/voltdb/voltdb-2.1.1
export CLASSPATH=$VOLTDB/lib/*:$VOLTDB/voltdb/*
#
WORK_FILE=/tmp/tmp00214
#
echo "*** 開始 ***"
id_in=$1
population_in=$2
today=`date '+%F'`
echo $id_in
echo $population_in
#
echo "update cities set population='$population_in' where id='$id_in'" > $WORK_FILE
echo "update cities set date_mod='$today' where id='$id_in'" > $WORK_FILE
#echo "update cities set population='$population_in' date_mod='$today' where id='$id_in'" > $WORK_FILE
echo 'select * from cities;' >> $WORK_FILE
echo 'quit' >> $WORK_FILE
#
$VOLTDB/bin/sqlcmd <$WORK_FILE
#
echo "*** 終了 ***"
#
