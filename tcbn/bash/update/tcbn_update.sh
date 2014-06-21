#! /bin/bash
#
#	tcbn_update.sh
#
#						Sep/14/2010
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
work_file="/tmp/tmp002945.txt"
file_tcb=$1
id_in=$2
population_in=$3
today=`date '+%F'`
#
echo $id_in
echo $population_in
tcbmgr get $file_tcb $id_in > $work_file
#
#awk -F: '{print $2}' $work_file | awk -F, '{print $1}'
head=`awk -F: '{print $1":"$2}' $work_file`
data=$head":"$population_in",\"date_mod\":\""$today"\"}"
echo $data
#
tcbmgr put $file_tcb $id_in $data
#
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------
