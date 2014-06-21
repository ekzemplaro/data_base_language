#! /bin/bash
#
#	drizzle_bash_create.sh
#
#					Mar/14/2012
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
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/drizzle"
#
#
drizzle -h localhost -uscott  < $sql_files/drizzle_create.sql
drizzle -h localhost -uscott  < $sql_files/drizzle_insert.sql
#
#
#
echo "*** OK ***"
#
# ---------------------------------------------------------------
