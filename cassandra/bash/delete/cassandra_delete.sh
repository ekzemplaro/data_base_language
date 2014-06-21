#! /bin/bash
#
#	cassandra_delete.sh
#
#						Sep/03/2013
#
# ------------------------------------------------------------------------
WORK_FILE="/tmp/tmp030451.txt"
#
key_in=$1
echo "*** 開始 ***"
echo $key_in
echo "use city;" > $WORK_FILE
echo "delete from cities where key = '$key_in';" >> $WORK_FILE
echo "quit;" >> $WORK_FILE
#
cqlsh < $WORK_FILE
#
rm -f $WORK_FILE
echo "*** 終了 ***"
# ------------------------------------------------------------------------
