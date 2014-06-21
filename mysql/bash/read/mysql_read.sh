#! /bin/bash
#
#	mysql_read.sh
#
#				Dec/27/2010
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/mysql"
#
echo	"*** 開始 ***"
#
#
mysql -h host_mysql -uscott -ptiger < $sql_files/mysql_read.sql
#
echo	"*** 終了 ***"
