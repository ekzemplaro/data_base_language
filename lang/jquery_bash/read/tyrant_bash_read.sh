#! /bin/bash
#
#	tyrant_bash_read.sh
#
#					Mar/27/2012
#
#
#
#
DATA_BASE=/var/www/data_base
BASH_COMMON=$DATA_BASE/common/bash_common
tyrant_read=$DATA_BASE/tyrant/bash/read
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
$tyrant_read/tyrant_read.sh \
	| awk '!/\*\*\*/{print $0}' \
 | $BASH_COMMON/txt_to_json.sh
#
#
