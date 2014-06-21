#! /bin/bash
#
#	derby_bash_read.sh
#
#					Feb/08/2011
#
#
#
# ----------------------------------------------------------
export DERBY_HOME=/home/uchida/data_base/derby/db-derby-10.6.2.1-bin
export PATH="$DERBY_HOME/bin:$PATH"
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
sql_files=$BASH_COMMON"/sql_files/derby"
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
ij $sql_files/derby_read.sql \
	| awk '{FS="|"}{if (substr ($1,0,2) == "35") print $1,$2,$3,$4}' \
	| $BASH_COMMON/txt_to_json.sh
#
#
# ----------------------------------------------------------
