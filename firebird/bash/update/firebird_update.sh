#! /bin/bash
#
#	firebird_update.sh
#
#				May/17/2012
#
# ---------------------------------------------------------------------
#
work_file="/tmp/tmp00721.txt"
#
echo "*** 開始 ***"
id_in=$1
population_in=$2
today=`date '+%F'`
#
echo $id_in
echo $population_in
#
echo "connect \"/var/tmp/firebird/cities.fdb\" user 'SYSDBA' password 'tiger';" > $work_file
echo "update cities set POPULATION = "$population_in",DATE_MOD = '"$today \
	"' where ID = '"$id_in"';" >> $work_file
echo	"commit;" >> $work_file
#
cat $work_file
#
isql-fb -q -i $work_file
#
rm $work_file
echo "*** 終了 ***"
# ---------------------------------------------------------------------
