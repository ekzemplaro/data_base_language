#! /bin/bash
#
#	oracle_bash_create.sh
#
#					Feb/08/2011
#
# ---------------------------------------------------------------
#
export PATH=$PATH:/mnt/sdb2/usr/lib/oracle/xe/app/oracle/product/10.2.0/client/bin
#
#
#
echo "Content-type: text/html"
echo ""
echo ""
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/oracle"
#
#
sqlplus scott/tiger@spn109:1521/xe @$sql_files/oracle_create.sql
sqlplus scott/tiger@spn109:1521/xe @$sql_files/oracle_insert.sql
#
#
echo "*** OK ***"
#
# ---------------------------------------------------------------
