#! /bin/bash
#
#	oracle_create.sh
#
#				Feb/08/2016
#
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/oracle"
#
echo	"*** 開始 ***"
#
sqlplus scott/tiger @$sql_files/oracle_create.sql
sqlplus scott/tiger @$sql_files/oracle_insert.sql
#
echo	"*** 終了 ***"
