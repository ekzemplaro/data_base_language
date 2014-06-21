#! /bin/bash
#
#	mssql_create.sh
#
#				Oct/03/2013
#
# --------------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/mssql"
HOST=host_mysql
#
echo	"*** 開始 ***"
#
sqsh -S host_mssql -U sa -P scott_tiger < $sql_files/mssql_create.sql
sqsh -S host_mssql -U sa -P scott_tiger < $sql_files/mssql_insert.sql
#
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
