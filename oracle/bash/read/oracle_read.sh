#! /bin/bash
#
#	oracle_read.sh
#
#				May/23/2011
#
export PATH=$PATH:/mnt/sdb2/usr/lib/oracle/xe/app/oracle/product/10.2.0/client/bin
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/oracle"
#
echo	"*** 開始 ***"
#
sqlplus scott/tiger@spn109:1521/xe @$sql_files/oracle_read.sql \
	| awk '{if (substr ($1,1,4) == "t013") print $1,$2,$3,$4}'
#
echo	"*** 終了 ***"
