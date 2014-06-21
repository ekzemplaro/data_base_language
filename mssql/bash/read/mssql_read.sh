#! /bin/bash
#
#	mssql_read.sh
#
#				Oct/03/2013
#
# --------------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/mssql"
#
echo	"*** 開始 ***"
#
sqsh -S host_mssql -U sa -P scott_tiger < $sql_files/mssql_read.sql | \
	awk '{if (0 < NF) print $1,$2,$3,$4}'
#
echo	"*** 終了 ***"
# --------------------------------------------------------------------------
