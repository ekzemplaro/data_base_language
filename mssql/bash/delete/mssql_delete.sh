#! /bin/bash
#
#	mssql_delete.sh
#
#				Oct/03/2013
#
# --------------------------------------------------------------------------
#
work_file="/tmp/tmp00428.txt"
#
echo	"*** 開始 ***"
id_in=$1
#
echo $id_in
#
echo "use city;" > $work_file
echo "delete from cities where ID = '"$id_in"'" >> $work_file
echo "go" >> $work_file
echo "exit" >> $work_file
#
cat $work_file
sqsh -S host_mssql -U sa -P scott_tiger < $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
