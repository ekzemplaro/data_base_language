#!/bin/bash
#
#	exist_update.sh
#
#			Jun/06/2013
#
# ----------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
AWK_FILES=$BASH_COMMON/awk_files
#
file_tmp_aa="/tmp/tmp00325.txt"
file_tmp_bb="/tmp/tmp00326.txt"
file_xml="/tmp/tmp00327.xml"
#
URL_IN="http://localhost:8086/exist/rest/cities/cities.xml"
URL_OUT="http://localhost:8086/exist/rest/cities/cities.xml"
#
#
echo "*** 開始 ***"
id_in=$1
population_in=$2
#
echo $id_in
echo $population_in
today=`date '+%F'`
#
curl -X GET $URL_IN | $BASH_COMMON/xml_to_txt.sh > $file_tmp_aa
#
awk -v id_in=$id_in -v population_in=$population_in -v today=$today \
	-f $AWK_FILES/awk_text_update $file_tmp_aa > $file_tmp_bb
#
#
awk -f $AWK_FILES/awk_to_xml $file_tmp_bb > $file_xml
#
curl -X PUT $URL_OUT -d@$file_xml
#
rm -f $file_tmp_aa
rm -f $file_tmp_bb
rm -f $file_xml
#
echo "*** 終了 ***"
# ----------------------------------------------------------------
