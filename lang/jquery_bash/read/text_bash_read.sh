#! /bin/bash
#
#	text_bash_read.sh
#
#					Feb/08/2011
#
#
#
#
file_in="/var/tmp/plain_text/cities.txt"
BASH_COMMON=/var/www/data_base/common/bash_common
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
cat $file_in | $BASH_COMMON/txt_to_json.sh
#
#
