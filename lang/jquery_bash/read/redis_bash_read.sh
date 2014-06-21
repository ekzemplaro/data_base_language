#! /bin/bash
#
#	redis_bash_read.sh
#
#					Feb/08/2011
#
#
#
#
data_base=/var/www/data_base
BASH_COMMON=$data_base/common/bash_common
redis_read=$data_base/redis/bash/read
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
$redis_read/redis_read.sh \
	| awk '!/\*\*\*/{print $0}' \
 | $BASH_COMMON/txt_to_json.sh
#
#
