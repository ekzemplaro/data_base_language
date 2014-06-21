#! /bin/bash
#
#	exist_create.sh
#
#					Jun/05/2013
#
#
# ---------------------------------------------------------------
function out_record
{
	echo '<'$id'>'  >> $file_xml
	echo ' <name>'$name'</name>'  >> $file_xml
	echo ' <population>'$population'</population>'  >> $file_xml
	echo ' <date_mod>'$date_mod'</date_mod>'  >> $file_xml
	echo '</'$id'>'  >> $file_xml
}
#
# ---------------------------------------------------------------
function data_prepare_proc
{
echo '<?xml version="1.0" standalone="yes"?>' > $file_xml
echo '<root>' >> $file_xml
#
id='t4251'
name='長崎'
population=75892
date_mod='2001-11-8'
out_record
#
id='t4252'
name='佐世保'
population=92356
date_mod='2001-10-26'
out_record
#
id='t4253'
name='島原'
population=82371
date_mod='2001-5-15'
out_record
#
id='t4254'
name='大村'
population=71823
date_mod='2001-6-23'
out_record
#
id='t4255'
name='諫早'
population=62549
date_mod='2001-9-21'
out_record
#
id='t4256'
name='五島'
population=58317
date_mod='2001-8-14'
out_record
#
id='t4257'
name='平戸'
population=42781
date_mod='2001-7-12'
out_record
#
id='t4258'
name='雲仙'
population=32613
date_mod='2001-3-16'
out_record
#
id='t4259'
name='松浦'
population=64935
date_mod='2001-2-27'
out_record
#
echo '</root>' >> $file_xml
#
}
# ---------------------------------------------------------------
echo "*** 開始 ***"
file_xml='/tmp/cities_23215.xml'
data_prepare_proc
#
#
URL="http://localhost:8086/exist/rest/cities/cities.xml"
#
#curl -X PUT $URL -d@$file_xml
#curl -i --upload-file $file_xml $URL --user admin:tiger
curl -i --upload-file $file_xml $URL
#
echo "*** rrr ***"
rm -f $file_xml
echo "*** 終了 ***"
# ---------------------------------------------------------------
#
