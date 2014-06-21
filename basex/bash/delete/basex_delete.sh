#!/bin/bash
#
#	basex_delete.sh
#
#			Feb/16/2012
#
# ----------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
AWK_FILES=$BASH_COMMON/awk_files
#
file_tmp_aa="/tmp/tmp00635.txt"
file_tmp_bb="/tmp/tmp00636.txt"
file_xml="/tmp/tmp00637.xml"
#
URL="http://admin:admin@localhost:8984/rest/cities"
URL_QQ=$URL"?query=/"
#
#
echo "*** 開始 ***"
key_in=$1
#
echo $key_in
#
curl -X GET $URL_QQ | $BASH_COMMON/xml_to_txt.sh > $file_tmp_aa
#
awk -v id_in=$key_in \
	-f $AWK_FILES/awk_text_delete $file_tmp_aa > $file_tmp_bb
#
#
awk -f $AWK_FILES/awk_to_xml $file_tmp_bb > $file_xml
#
curl -X PUT $URL -T $file_xml
#
rm -f $file_tmp_aa
rm -f $file_tmp_bb
rm -f $file_xml
##
echo "*** 終了 ***"
# ----------------------------------------------------------------
