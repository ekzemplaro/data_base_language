#! /bin/bash
#
#	postgre_bash_read.sh
#
#					Sep/23/2013
#
#
#
# ----------------------------------------------------------
export PGPASSWORD='tiger'
BASH_COMMON=/var/www/data_base/common/bash_common
#
sql_files=$BASH_COMMON"/sql_files/postgre"
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
psql -h localhost -f $sql_files/postgre_read.sql -U scott city \
	| awk '{if (substr ($1,1,3) == "t34") print $1,$3,$5,$7}' \
	| $BASH_COMMON/txt_to_json.sh
#
#
# ----------------------------------------------------------
