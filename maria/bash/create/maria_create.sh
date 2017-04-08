#! /bin/bash
#
#	maria_create.sh
#
#				Apr/07/2017
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/maria"
HOST=localhost
#
echo	"*** 開始 ***"
#
mysql -h $HOST -uscott -ptiger123 < $sql_files/maria_create.sql
mysql -h $HOST -uscott -ptiger123 < $sql_files/maria_insert.sql
#
echo	"*** 終了 ***"
