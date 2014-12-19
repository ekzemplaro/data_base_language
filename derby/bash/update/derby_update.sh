#! /bin/bash
#
#	update/derby_update.sh
#
#					Nov/28/2014
#
# ---------------------------------------------------------------------
export DERBY_BIN=/usr/share/java/derby/bin
export PATH="$DERBY_BIN:$PATH"
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
