#! /bin/bash
#
#	sqlit3_create.sh
#
#				Dec/16/2011
#
# -------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/sqlite3"
#
sqlite3_file=$1
#
echo "*** 開始 ***"
#
sqlite3 $sqlite3_file < $sql_files/sqlite3_create.sql
sqlite3 $sqlite3_file < $sql_files/sqlite3_insert.sql
#
chmod 777 $sqlite3_file
echo "*** 終了 ***"
# -------------------------------------------------------------
