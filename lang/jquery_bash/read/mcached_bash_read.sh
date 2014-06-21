#! /bin/bash
#
#	mcached_bash_read.sh
#
#					Feb/08/2011
#
#
#
#
DATA_BASE=/var/www/data_base
BASH_COMMON=$DATA_BASE/common/bash_common
mcached_read=$DATA_BASE/mcached/bash/read
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
$mcached_read/mcached_read.sh \
	| awk '!/\*\*\*/{print $0}' \
 | $BASH_COMMON/txt_to_json.sh
#
#
