#! /bin/bash
#
#	mcached_update.sh
#
#						Feb/08/2011
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
work_file="/tmp/tmp00724.txt"
id_in=$1
population_in=$2
today=`date '+%F'`
#
echo $id_in
echo $population_in
memccat --servers=localhost:11211 $id_in > $work_file
#
head=`awk -F, '{print $1}' $work_file`",\"population\":"
data=$head$population_in",\"date_mod\":\""$today"\"}"
echo $data > $id_in
#
memccp --servers=localhost:11211 --set $id_in
# --------------------------------------------------------------------------
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------
