#! /bin/bash
#
#	mssql_update.sh
#
#				Oct/03/2013
#
# --------------------------------------------------------------------------
#
work_file="/tmp/tmp00326.txt"
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
	"' where ID = '"$id_in"'" >> $work_file
echo "go" >> $work_file
echo "exit" >> $work_file
#
cat $work_file
sqsh -S host_mssql -U sa -P scott_tiger < $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
