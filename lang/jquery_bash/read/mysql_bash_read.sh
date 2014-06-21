#! /bin/bash
#
#	mysql_bash_read.sh
#
#					Feb/08/2011
#
#
#
# ----------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
sql_files=$BASH_COMMON"/sql_files/mysql"
HOST=host_mysql
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
mysql -h $HOST -uscott -ptiger < $sql_files/mysql_read.sql \
	| $BASH_COMMON/txt_to_json.sh
#
#
# ----------------------------------------------------------
