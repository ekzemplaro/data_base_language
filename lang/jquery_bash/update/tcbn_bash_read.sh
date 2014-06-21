#! /bin/bash
#
#	tcbn_bash_read.sh
#
#					Feb/08/2011
#
# --------------------------------------------------------------
#
#
data_base=/var/www/data_base
BASH_COMMON=$data_base/common/bash_common
tcbn_read=$data_base/tcbn/bash/read
file_tcb=/var/tmp/tokyo_cabinet/cities.tcb
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
$tcbn_read/tcbn_read.sh $file_tcb \
	| awk '!/\*\*\*/{print $0}' \
 | $BASH_COMMON/txt_to_json.sh
#
#
