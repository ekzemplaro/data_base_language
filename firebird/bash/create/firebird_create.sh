#! /bin/bash
#
#	firebird_create.sh
#
#				May/30/2011
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/firebird"
WORK_AA=/tmp/tmp001.txt
WORK_BB=/tmp/tmp002.txt
#
echo "*** 開始 ***"
#
isql-fb -q -i $sql_files/firebird_create.sql -e -m -o $WORK_AA
isql-fb -q -i $sql_files/firebird_insert.sql -e -m -o $WORK_BB
#
rm -f $WORK_AA
rm -f $WORK_BB
#
echo "*** 終了 ***"
