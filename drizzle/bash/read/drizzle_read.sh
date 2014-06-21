#! /bin/bash
#
#	drizzle_read.sh
#
#				Mar/14/2012
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/drizzle"
#
echo	"*** 開始 ***"
#
#
drizzle -h localhost -u scott city < $sql_files/drizzle_read.sql
#
echo	"*** 終了 ***"
