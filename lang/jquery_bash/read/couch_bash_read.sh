#! /bin/bash
#
#	couch_bash_read.sh
#
#					Aug/19/2014
#
data_base=/var/www/data_base
BASH_COMMON=$data_base/common/bash_common
couch_read=$data_base/couch/bash/read
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
$couch_read/couch_read.sh \
	| awk '!/\*\*\*/{print $0}' \
 | $BASH_COMMON/txt_to_json.sh
#
#
#
