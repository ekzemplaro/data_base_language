#! /bin/bash
#
#	mysql_create.sh
#
#				Dec/20/2010
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/mysql"
HOST=host_mysql
#
echo	"*** 開始 ***"
#
mysql -h $HOST -uscott -ptiger < $sql_files/mysql_create.sql
mysql -h $HOST -uscott -ptiger < $sql_files/mysql_insert.sql
#
echo	"*** 終了 ***"
