#! /bin/bash
#
#	derby_delete.sh
#
#					Nov/28/2014
#
# ---------------------------------------------------------------------
export DERBY_BIN=/usr/share/java/derby/bin
export PATH="$DERBY_BIN:$PATH"
#
work_file="/tmp/tmp00548.txt"
# ---------------------------------------------------------------------
echo	"*** 開始 ***"
id_in=$1
#
echo $id_in
#
echo "connect 'jdbc:derby://localhost:1527/city_aaa';" > $work_file
echo "delete from cities where ID = '"$id_in"';" >> $work_file
echo "quit;" >> $work_file
#
cat $work_file
#
ij $work_file
#
rm -f $work_file
echo	"*** 終了 ***"
# ---------------------------------------------------------------------
