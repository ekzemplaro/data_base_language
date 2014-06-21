#! /bin/bash
#
#	sqlite3_bash_create.sh
#
#					Feb/08/2011
#
#
#
#
#
#
echo "Content-type: text/html"
echo ""
echo ""
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/sqlite3"
#
sqlite3_file=/var/tmp/sqlite3/cities.db
#
#
sqlite3 $sqlite3_file < $sql_files/sqlite3_create.sql
sqlite3 $sqlite3_file < $sql_files/sqlite3_insert.sql
#
#
#
echo "*** OK ***"
#
