#! /bin/bash
#
#	mongo_bash_read.sh
#
#					Mar/02/2011
#
# -------------------------------------------------------------------
#
file_in="/var/tmp/plain_text/cities.txt"
BASH_COMMON=/var/www/data_base/common/bash_common
#
#
file_tmp_aa="/tmp/tmp005189"
#
echo "Content-type: text/json"
echo ""
echo ""
#
mongoexport -d city_db -c saitama > $file_tmp_aa
#
awk -F ',' '{print $2,$3,$4,$5}' $file_tmp_aa | \
	awk '{print $3,$6,$9,$12}' | sed 's/\"//g' | \
	$BASH_COMMON/txt_to_json.sh
#
#
#cat $file_in | $BASH_COMMON/txt_to_json.sh
#
rm -f $file_tmp_aa
#
