#! /bin/bash
#
#	postgre_update.sh
#
#					Jan/19/2012
#
# ----------------------------------------------------------
export PGPASSWORD='tiger'
#
work_file="/tmp/tmp00946.txt"
#
echo "*** 開始 ***"
id_in=$1
population_in=$2
today=`date '+%F'`
#
echo $id_in
echo $population_in
#
echo "update cities set POPULATION = "$population_in",DATE_MOD = '"$today \
	"' where ID = '"$id_in"';" > $work_file
#
cat $work_file
psql -h localhost -f $work_file -U scott city
#
rm -f $work_file
echo "*** 終了 ***"
#
# ----------------------------------------------------------
