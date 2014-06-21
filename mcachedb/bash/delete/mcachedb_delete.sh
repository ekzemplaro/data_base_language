#! /bin/bash
#
#	mcachedb_delete.sh
#
#						Jun/24/2011
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
id_in=$1
#
echo $id_in
#
work_file_aa="/tmp/tmp0089153.txt"
data_aa="echo  \"delete $id_in\""
echo $data_aa >> $work_file_aa
bash $work_file_aa | telnet 127.0.0.1 21201
#
rm -f $work_file_aa
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------
