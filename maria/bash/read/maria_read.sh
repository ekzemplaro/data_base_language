#! /bin/bash
#
#	maria_read.sh
#
#				Apr/25/2017
#
#BASH_COMMON=/var/www/data_base/common/bash_common
BASH_COMMON=../../../common/bash_common
sql_files=$BASH_COMMON"/sql_files/maria"
#
echo	"*** 開始 ***"
#
#
mysql -h localhost -uscott -ptiger123 < $sql_files/maria_read.sql
#
echo	"*** 終了 ***"
