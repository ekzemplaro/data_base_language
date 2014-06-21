#! /bin/bash
#
#	maria_read.sh
#
#				Sep/16/2013
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/maria"
#
echo	"*** 開始 ***"
#
#
mysql -h localhost -uscott -ptiger < $sql_files/maria_read.sql
#
echo	"*** 終了 ***"
