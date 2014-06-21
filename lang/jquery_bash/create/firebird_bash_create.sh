#! /bin/bash
#
#	firebird_bash_create.sh
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
sql_files=$BASH_COMMON"/sql_files/firebird"
#
#
isql-fb -q -i $sql_files/firebird_create.sql -e -m -o /tmp/tmp0011.txt
isql-fb -q -i $sql_files/firebird_insert.sql -e -m -o /tmp/tmp0012.txt
#
rm -f /tmp/tmp0011.txt
rm -f /tmp/tmp0012.txt
#
#
echo "*** OK ***"
#
# ---------------------------------------------------------------
