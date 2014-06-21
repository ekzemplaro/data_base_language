#! /bin/bash
#
#	xml_delete.sh
#
#					Dec/26/2011
#
# ----------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
AWK_FILES=$BASH_COMMON/awk_files
#
file_tmp_aa="/tmp/tmp00415.txt"
file_tmp_bb="/tmp/tmp00416.txt"
#
echo "*** 開始 ***"
#
file_xml=$1
id_in=$2
#
echo $id_in
#
cat $file_xml | $BASH_COMMON/xml_to_txt.sh > $file_tmp_aa
#
awk -v id_in=$id_in \
	-f $AWK_FILES/awk_text_delete $file_tmp_aa > $file_tmp_bb
#
awk -f $AWK_FILES/awk_to_xml $file_tmp_bb > $file_xml
#
echo "*** 終了 ***"
# ----------------------------------------------------------------
