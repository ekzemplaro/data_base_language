#! /bin/bash
#
#	sqlite3_update.sh
#
#					Dec/16/2011
#
# -------------------------------------------------------------
work_file="/tmp/tmp00476.txt"
#
echo "*** 開始 ***"
#
sqlite3_file=$1
id_in=$2
population_in=$3
today=`date '+%F'`
#
echo $id_in
echo $population_in
#
echo "update cities set POPULATION = "$population_in",DATE_MOD = '"$today \
	"' where ID = '"$id_in"';" > $work_file
#
cat $work_file
sqlite3 $sqlite3_file < $work_file
#
rm -f $work_file
echo "*** 終了 ***"
#
# -------------------------------------------------------------
