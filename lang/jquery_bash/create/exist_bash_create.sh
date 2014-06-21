#! /bin/bash
#
#	exist_bash_create.sh
#
#					Jul/05/2011
#
# ----------------------------------------------------------------
function out_record
{
	echo ' <'$id'>'  >> $file_xml
	echo ' <name>'$name'</name>'  >> $file_xml
	echo ' <population>'$population'</population>'  >> $file_xml
	echo ' <date_mod>'$date_mod'</date_mod>'  >> $file_xml
	echo ' </'$id'>'  >> $file_xml
}
#
# ---------------------------------------------------------------
function data_prepare
{
echo '<root>' > $file_xml
#
id='t4251'
name='長崎'
population=89400
date_mod='2001-3-15'
out_record
#
id='t4252'
name='佐世保'
population=32500
date_mod='2001-2-26'
out_record
#
id='t4253'
name='島原'
population=87500
date_mod='2001-7-15'
out_record
#
id='t4254'
name='大村'
population=71500
date_mod='2001-6-23'
out_record
#
id='t4255'
name='諫早'
population=62300
date_mod='2001-9-21'
out_record
#
id='t4256'
name='五島'
population=52400
date_mod='2001-8-14'
out_record
#
id='t4257'
name='平戸'
population=42700
date_mod='2001-9-12'
out_record
#
id='t4258'
name='雲仙'
population=32600
date_mod='2001-10-14'
out_record
#
id='t4259'
name='松浦'
population=62900
date_mod='2001-5-24'
out_record
#
echo '</root>' >> $file_xml
#
}
#
# ----------------------------------------------------------------
#
echo "Content-type: text/html"
echo ""
echo ""
#
file_xml='/tmp/cities_392.xml'
data_prepare
#
URL="http://localhost:8086/exist/rest/db/cities/cities.xml"
curl -X PUT $URL -d@$file_xml
rm -f $file_xml
#
#
echo "*** OK ***"
#
# ----------------------------------------------------------------
