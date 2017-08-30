#! /bin/bash
#
#	mssql_create.sh
#
#				Oct/03/2013
#
# --------------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/mssql"
HOST=localhost
PASS=Sql12345
#
echo	"*** 開始 ***"
#
sqsh -S $HOST -U sa -P $PASS < $sql_files/mssql_create.sql
sqsh -S $HOST -U sa -P $PASS < $sql_files/mssql_insert.sql
#
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
