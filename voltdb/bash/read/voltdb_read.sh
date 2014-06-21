#! /bin/bash
#
#	voltdb_read.sh
#					Jan/30/2012
#
VOLTDB=/home/uchida/dbm/voltdb/voltdb-2.1.1
export CLASSPATH=$VOLTDB/lib/*:$VOLTDB/voltdb/*
#
echo "*** 開始 ***"
#
#java org.voltdb.utils.SQLCommand << EOF
$VOLTDB/bin/sqlcmd << EOF
select * from cities;
quit;
EOF
#
echo "*** 終了 ***"
#
