#! /bin/bash
#
#	postgre_bash_create.sh
#
#					Sep/23/2013
#
# ---------------------------------------------------------------
#
#
#
#
echo "Content-type: text/html"
echo ""
echo ""
#
export PGPASSWORD='tiger'
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/postgre"
#
#
psql -h localhost -f $sql_files/postgre_create.sql -U scott city
psql -h localhost -f $sql_files/postgre_insert.sql -U scott city
#
#
echo "*** OK ***"
#
# ---------------------------------------------------------------
