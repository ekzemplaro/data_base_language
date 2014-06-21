#! /bin/bash
#
#	firebird_delete.sh
#
#				Dec/16/2011
#
# ---------------------------------------------------------------------
#
work_file="/tmp/tmp00724.txt"
#
echo "*** 開始 ***"
id_in=$1
#
echo $id_in
#
echo "connect \"/var/tmp/firebird/cities.fdb\" user 'SYSDBA' password 'tiger';" > $work_file
echo "delete from cities where ID = '"$id_in"';" >> $work_file
echo	"commit;" >> $work_file
#
cat $work_file
#
isql-fb -q -i $work_file
#
rm $work_file
echo "*** 終了 ***"
# ---------------------------------------------------------------------
