#! /bin/bash
#
#	drizzle_update.sh
#
#				Mar/14/2012
#
# --------------------------------------------------------------------------
#
#
work_file="/tmp/tmp00826.txt"
#
echo	"*** 開始 ***"
id_in=$1
population_in=$2
today=`date '+%F'`
#
echo $id_in
echo $population_in
#
echo "use city;" > $work_file
echo "update cities set POPULATION = "$population_in",DATE_MOD = '"$today"' where ID = '"$id_in"';" >> $work_file
#
cat $work_file
drizzle -h localhost -u scott < $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
