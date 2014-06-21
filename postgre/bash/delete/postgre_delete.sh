#! /bin/bash
#
#	postgre_delete.sh
#
#					Jan/19/2012
#
# ----------------------------------------------------------
export PGPASSWORD='tiger'
#
work_file="/tmp/tmp00947.txt"
#
echo "*** 開始 ***"
id_in=$1
#
echo $id_in
#
echo "delete from cities where ID = '"$id_in"';" > $work_file
#
cat $work_file
psql -h localhost -f $work_file -U scott city
#
rm -f $work_file
echo "*** 終了 ***"
#
# ----------------------------------------------------------
