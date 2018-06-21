#! /bin/bash
#
#	mongo_read.sh
#					Sep/02/2013
#
# ---------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
file_tmp_aa="/tmp/tmp00514"
#
echo "*** 開始 ***"
#
mongoexport --username scott --password tiger123 --db city_db -c saitama | jq .key,.name,.population,.date_mod \
	| sed 's/\"//g' > $file_tmp_aa
#
awk -f $BASH_COMMON/awk_files/awk_calc_filter $file_tmp_aa
#
rm -f $file_tmp_aa
#
echo "*** 終了 ***"
#
