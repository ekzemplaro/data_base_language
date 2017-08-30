#! /bin/bash
#
#	mssql_read.sh
#
#				Aug/30/2017
#
# --------------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/mssql"
HOST=localhost
PASS=Sql12345
#
echo	"*** 開始 ***"
#
sqsh -S $HOST -U sa -P $PASS < $sql_files/mssql_read.sql | \
	awk '{if (0 < NF) print $1,$2,$3,$4}'
#
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
