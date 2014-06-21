#! /bin/bash
#
#	mysql_bash_create.sh
#
#					Feb/08/2011
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
sql_files=$BASH_COMMON"/sql_files/mysql"
#
#
mysql -h host_mysql -uscott -ptiger < $sql_files/mysql_create.sql
mysql -h host_mysql -uscott -ptiger < $sql_files/mysql_insert.sql
#
#
#
echo "*** OK ***"
#
# ---------------------------------------------------------------
