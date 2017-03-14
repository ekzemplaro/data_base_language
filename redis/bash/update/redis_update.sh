#! /bin/bash
#
#	redis_update.sh
#
#						Mar/15/2017
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
hostname="localhost"
#
work_file="/tmp/tmp0045.txt"
id_in=$1
population_in=$2
today=`date '+%F'`
#
echo $id_in
echo $population_in
redis-cli -h host_dbase -p 6379 get $id_in > $work_file
#
head=`awk -F: '{print $1":"$2}' $work_file`
data=$head":"$population_in",\"date_mod\":\""$today"\"}"
echo $data
redis-cli -h $hostname -p 6379 set $id_in $data
#
# --------------------------------------------------------------------------
#
rm -f $work_file
echo "*** 終了 ***"
# --------------------------------------------------------------------------
