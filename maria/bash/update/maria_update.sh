#! /bin/bash
#
#	maria_update.sh
#
#				Apr/25/2014
#
# --------------------------------------------------------------------------
#
#
work_file="/tmp/tmp0084316.txt"
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
echo "update cities set POPULATION = "$population_in",DATE_MOD = '"$today \
	"' where ID = '"$id_in"';" >> $work_file
#
cat $work_file
mysql -h localhost -uscott -ptiger123 < $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
