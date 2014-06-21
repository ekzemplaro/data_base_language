#! /bin/bash
#
#	drizzle_delete.sh
#
#				Mar/14/2012
#
# --------------------------------------------------------------------------
#
work_file="/tmp/tmp00947.txt"
#
echo	"*** 開始 ***"
id_in=$1
#
echo $id_in
#
echo "use city;" > $work_file
echo "delete from cities where ID = '"$id_in"';" >> $work_file
#
cat $work_file
drizzle -h localhost -u scott < $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
