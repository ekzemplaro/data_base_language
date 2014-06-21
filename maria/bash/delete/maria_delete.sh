#! /bin/bash
#
#	maria_delete.sh
#
#				Sep/16/2013
#
# --------------------------------------------------------------------------
#
work_file="/tmp/tmp0082157.txt"
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
mysql -h localhost -uscott -ptiger < $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
