#! /bin/bash
#
#	mcachedb_bash_read.sh
#
#					Feb/08/2011
#
#
#
#
DATA_BASE=/var/www/data_base
BASH_COMMON=$DATA_BASE/common/bash_common
mcachedb_read=$DATA_BASE/mcachedb/bash/read
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
$mcachedb_read/mcachedb_read.sh \
	| awk '!/\*\*\*/{print $0}' \
 | $BASH_COMMON/txt_to_json.sh
#
#
