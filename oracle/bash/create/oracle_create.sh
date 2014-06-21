#! /bin/bash
#
#	oracle_create.sh
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
sqlplus scott/tiger@spn109:1521/xe @$sql_files/oracle_create.sql
sqlplus scott/tiger@spn109:1521/xe @$sql_files/oracle_insert.sql
#
echo	"*** 終了 ***"
