#! /bin/bash
#
#	mcachedb_delete.sh
#
#						Feb/17/2015
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
SERVER="host_ubuntu1"
PORT=21201
key_in=$1
#
echo $key_in
#
work_file_aa="/tmp/tmp0089153.txt"
data_aa="echo  \"delete $key_in\""
echo $data_aa >> $work_file_aa
bash $work_file_aa | telnet $SERVER $PORT
#
rm -f $work_file_aa
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------
