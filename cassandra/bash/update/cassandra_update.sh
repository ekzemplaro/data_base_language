#! /bin/bash
#
#	cassandra_update.sh
#
#						Sep/03/2013
#
# -----------------------------------------------------------------------
WORK_FILE="/tmp/tmp030251.txt"
#
echo "*** 開始 ***"
#
key_in=$1
population_in=$2
today=`date '+%F'`
echo $today
#
echo $key_in
echo $population_in
#
echo "use city;" > $WORK_FILE
echo "update cities set population = $population_in, date_mod = '$today' where key = '$key_in';" >> $WORK_FILE
echo "quit;" >> $WORK_FILE
#
cqlsh < $WORK_FILE
#
rm -f $WORK_FILE
#
echo "*** 終了 ***"
# -----------------------------------------------------------------------
