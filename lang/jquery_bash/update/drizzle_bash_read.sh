#! /bin/bash
#
#	drizzle_bash_read.sh
#
#					Mar/14/2012
#
#
#
# ----------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
sql_files=$BASH_COMMON"/sql_files/drizzle"
HOST=localhost
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
drizzle -h $HOST -u scott city < $sql_files/drizzle_read.sql \
	| $BASH_COMMON/txt_to_json.sh
#
#
# ----------------------------------------------------------
