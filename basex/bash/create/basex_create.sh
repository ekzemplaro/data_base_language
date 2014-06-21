#!/bin/bash
#
#	basex_create.sh
#
#					Oct/29/2013
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
out_record 't4161' '佐賀' 35162 '2001-7-4'
out_record 't4162' '唐津' 57648 '2001-12-15'
out_record 't4163' '鳥栖' 86397 '2001-3-12'
out_record 't4164' '多久' 43165 '2001-4-14'
out_record 't4165' '伊万里' 29481 '2001-5-21'
out_record 't4166' '武雄' 35627 '2001-6-25'
out_record 't4167' '鹿島' 91465 '2001-8-9'
out_record 't4168' '小城' 19257 '2001-9-12'
out_record 't4169' '嬉野' 72358 '2001-10-24'
#
echo '</root>' >> $file_xml
#
}
#
# ---------------------------------------------------------------
echo "*** 開始 ***"
export http_proxy=""
file_xml='/tmp/cities.xml'
data_prepare_proc
#
echo "*** ppp ***"
#
curl -X PUT http://admin:admin@localhost:8984/rest/cities -T $file_xml
#
rm -f $file_xml
echo "*** 終了 ***"
# ---------------------------------------------------------------
