#! /bin/bash
#
#	mysql_delete.sh
#
#				Dec/16/2011
#
# --------------------------------------------------------------------------
#
work_file="/tmp/tmp00827.txt"
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
mysql -h host_mysql -uscott -ptiger < $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
