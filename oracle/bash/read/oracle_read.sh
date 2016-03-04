#! /bin/bash
#
#	oracle_read.sh
#
#				Feb/06/2016
#
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/oracle"
#
echo	"*** 開始 ***"
#
sqlplus scott/tiger @$sql_files/oracle_read.sql \
	| awk '{if (substr ($1,1,4) == "t013") print $1,$2,$3,$4}'
#
echo	"*** 終了 ***"
#
