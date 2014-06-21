#! /bin/bash
#
#	drizzle_create.sh
#
#				Mar/14/2012
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/drizzle"
HOST=localhost
#
echo	"*** 開始 ***"
#
drizzle -h $HOST -u scott < $sql_files/drizzle_create.sql
drizzle -h $HOST -u scott < $sql_files/drizzle_insert.sql
#
echo	"*** 終了 ***"
