#! /bin/bash
#
#	sqlite3_read.sh
#
#					Dec/16/2011
#
# -------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/sqlite3"
#
echo "*** 開始 ***"
#
sqlite3_file=$1
#
sqlite3 $sqlite3_file < $sql_files/sqlite3_read.sql
#
echo "*** 終了 ***"
#
# -------------------------------------------------------------
