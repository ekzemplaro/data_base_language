#! /bin/bash
#
#	sqlite3_delete.sh
#
#					Dec/16/2011
#
# -------------------------------------------------------------
work_file="/tmp/tmp00479.txt"
#
echo "*** 開始 ***"
#
sqlite3_file=$1
id_in=$2
#
echo $id_in
#
echo "delete from cities where ID = '"$id_in"';" > $work_file
#
cat $work_file
sqlite3 $sqlite3_file < $work_file
#
rm -f $work_file
echo "*** 終了 ***"
#
# -------------------------------------------------------------
