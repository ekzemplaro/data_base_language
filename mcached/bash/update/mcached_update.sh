#! /bin/bash
#
#	mcached_update.sh
#
#						Feb/17/2015
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
SERVER=localhost
PORT=11211
cd /tmp
#
work_file="/tmp/tmp00724.txt"
key_in=$1
population_in=$2
today=`date '+%F'`
#
echo $key_in
echo $population_in
memcat --servers=$SERVER:$PORT $key_in > $work_file
#
head=`awk -F, '{print $1}' $work_file`",\"population\":"
data=$head$population_in",\"date_mod\":\""$today"\"}"
echo $data > $key_in
#
memcp --servers=$SERVER:$PORT --set $key_in
# --------------------------------------------------------------------------
#
rm -f /tmp/$key_in
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------
