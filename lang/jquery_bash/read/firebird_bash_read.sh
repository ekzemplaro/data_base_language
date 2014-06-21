#! /bin/bash
#
#	firebird_bash_read.sh
#
#					May/30/2011
#
#
#
# ----------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
sql_files=$BASH_COMMON"/sql_files/firebird"
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
isql-fb -q -i $sql_files/firebird_read.sql \
	| awk '{if (substr ($1,1,3) == "t38") print $1,$2,$3,$4}' \
	| $BASH_COMMON/txt_to_json.sh
#
#
# ----------------------------------------------------------
