#!/bin/bash
#
#	xindice_create.sh
#
#					Jul/05/2011
#
#
# ---------------------------------------------------------------
function out_record ()
{
	echo '<'$1'>'  >> $file_xml
	echo ' <name>'$2'</name>'  >> $file_xml
	echo ' <population>'$3'</population>'  >> $file_xml
	echo ' <date_mod>'$4'</date_mod>'  >> $file_xml
	echo '</'$1'>'  >> $file_xml
}
#
# ---------------------------------------------------------------
function data_prepare_proc
{
echo '<?xml version="1.0" standalone="yes"?>' > $file_xml
echo '<root>' >> $file_xml
#
out_record 't0271' '青森' 86291 '2001-2-9'
out_record 't0272' '弘前' 57148 '2001-8-25'
out_record 't0273' '八戸' 86297 '2001-3-12'
out_record 't0274' '三沢' 43163 '2001-4-14'
out_record 't0275' '黒石' 29481 '2001-5-21'
out_record 't0276' 'むつ' 35327 '2001-6-25'
out_record 't0277' '五所川原' 95385 '2001-8-9'
out_record 't0278' '十和田' 19387 '2001-9-12'
out_record 't0279' '平川' 79382 '2001-10-24'
#
echo '</root>' >> $file_xml
#
}
#
# ---------------------------------------------------------------
echo "*** 開始 ***"
file_xml='/tmp/cities.xml'
data_prepare_proc
#
XINDICE_HOME=/home/uchida/xml_database/xindice/xml-xindice-1.2m1
XINDICE=$XINDICE_HOME"/bin/xindice"
echo "*** ppp ***"
#
$XINDICE ad -c xmldb:xindice://cddn007:8888/db/cities -n cities -f $file_xml
#
rm -f $file_xml
echo "*** 終了 ***"
# ---------------------------------------------------------------
