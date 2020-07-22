#! /bin/bash
#
#	postgre_create.sh
#
#				Jul/22/2020
#
# -------------------------------------------------------------------
export PGPASSWORD='tiger123'
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/postgre"
#
echo "*** 開始 ***"
#
#
psql -h localhost -f $sql_files/postgre_create.sql -U scott city
psql -h localhost -f $sql_files/postgre_insert.sql -U scott city
#
echo "*** 終了 ***"
#
# -------------------------------------------------------------------
