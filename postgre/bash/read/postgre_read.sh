#! /bin/bash
#
#	postgre_read.sh
#
#					Jul/22/2020
#
# ----------------------------------------------------------
export PGPASSWORD='tiger123'
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/postgre"
#
echo "*** 開始 ***"
#
psql -h localhost -f $sql_files/postgre_read.sql -U scott city | \
	awk '{if (substr ($1,1,3) == "t34") print $1,$3,$5,$7}'
#
echo "*** 終了 ***"
#
# ----------------------------------------------------------
