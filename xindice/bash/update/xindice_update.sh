#!/bin/bash
#
#	xindice_update.sh
#
#			Dec/28/2011
#
# ------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
AWK_FILES=$BASH_COMMON/awk_files
XINDICE_HOME=/home/uchida/xml_database/xindice/xml-xindice-1.2m1
XINDICE=$XINDICE_HOME"/bin/xindice"
#
export http_proxy=""
URL="http://host_dbase:8888/xindice/db/cities/cities"
#
#
file_tmp_aa="/tmp/tmp00625.txt"
file_tmp_bb="/tmp/tmp00626.txt"
file_xml="/tmp/tmp00627.xml"
#
# ------------------------------------------------------------
echo	"*** 開始 ***"
id_in=$1
population_in=$2
#
echo $id_in
echo $population_in
today=`date '+%F'`
#
curl -X GET $URL | $BASH_COMMON/xml_to_txt.sh > $file_tmp_aa
#
awk -v id_in=$id_in -v population_in=$population_in -v today=$today \
	-f $AWK_FILES/awk_text_update $file_tmp_aa > $file_tmp_bb
#
#
awk -f $AWK_FILES/awk_to_xml $file_tmp_bb > $file_xml
#
echo "*** ppp ***"
#
$XINDICE ad -c xmldb:xindice://host_dbase:8888/db/cities -n cities -f $file_xml
#
#
echo	"*** 終了 ***"
# ------------------------------------------------------------
