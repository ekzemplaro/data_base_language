#! /bin/bash
#
#	derby_update.sh
#
#					Jul/06/2012
#
# ---------------------------------------------------------------------
export DERBY_HOME=/usr/share/javadb
export PATH="$DERBY_HOME/bin:$PATH"
#
work_file="/tmp/tmp00546.txt"
# ---------------------------------------------------------------------
echo	"*** 開始 ***"
id_in=$1
population_in=$2
today=`date '+%F'`
#
echo $id_in
echo $population_in
#
echo "connect 'jdbc:derby://localhost:1527/city_aaa';" > $work_file
echo "update cities set POPULATION = "$population_in",DATE_MOD = '"$today \
	"' where ID = '"$id_in"';" >> $work_file
echo "quit;" >> $work_file
#
cat $work_file
#
ij $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# ---------------------------------------------------------------------
