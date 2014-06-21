#! /bin/bash
#
#	xml_update.sh
#
#					Dec/26/2011
#
# ----------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
AWK_FILES=$BASH_COMMON/awk_files
#
file_tmp_aa="/tmp/tmp00315.txt"
file_tmp_bb="/tmp/tmp00316.txt"
#
echo "*** 開始 ***"
#
file_xml=$1
id_in=$2
population_in=$3
#
echo $id_in
echo $population_in
today=`date '+%F'`
#
cat $file_xml | $BASH_COMMON/xml_to_txt.sh > $file_tmp_aa
#
awk -v id_in=$id_in -v population_in=$population_in -v today=$today \
	-f $AWK_FILES/awk_text_update $file_tmp_aa > $file_tmp_bb
#
#
awk -f $AWK_FILES/awk_to_xml $file_tmp_bb > $file_xml
#
echo "*** 終了 ***"
# ----------------------------------------------------------------
