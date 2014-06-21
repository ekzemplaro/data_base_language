#! /bin/bash
#
#	oracle_bash_read.sh
#
#					Feb/08/2011
#
#
#
# ----------------------------------------------------------
ORACLE_BIN=/mnt/sdb2/usr/lib/oracle/xe/app/oracle/product/10.2.0/client/bin
export PATH=$PATH:$ORACLE_BIN
BASH_COMMON=/var/www/data_base/common/bash_common
#
sql_files=$BASH_COMMON"/sql_files/oracle"
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
sqlplus scott/tiger@spn109:1521/xe @$sql_files/oracle_read.sql \
	| awk '{if (substr ($1,1,2) == "13") print $1,$2,$3,$4}' \
	| $BASH_COMMON/txt_to_json.sh
#
#
# ----------------------------------------------------------
