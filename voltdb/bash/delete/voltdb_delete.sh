#! /bin/bash
#
#	voltdb_delete.sh
#					Jan/30/2012
#
VOLTDB=/home/uchida/dbm/voltdb/voltdb-2.1.1
export CLASSPATH=$VOLTDB/voltdb/*
#
WORK_FILE=/tmp/tmp00213
#
echo "*** 開始 ***"
id_in=$1
echo $id_in
#
echo "delete from cities where id='$id_in'" > $WORK_FILE
echo 'select * from cities;' >> $WORK_FILE
echo 'quit' >> $WORK_FILE
#
$VOLTDB/bin/sqlcmd <$WORK_FILE
#
echo "*** 終了 ***"
#
