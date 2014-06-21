#! /bin/bash
#
#	sqlite3_bash_read.sh
#
#					Feb/08/2011
#
#
#
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
sqlite3_file=/var/tmp/sqlite3/cities.db
sql_files=$BASH_COMMON"/sql_files/sqlite3"
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
sqlite3 $sqlite3_file < $sql_files/sqlite3_read.sql \
	| $BASH_COMMON/txt_to_json.sh
#
#
