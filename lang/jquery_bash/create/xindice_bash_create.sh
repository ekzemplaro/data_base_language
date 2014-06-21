#! /bin/bash
#
#	xindice_bash_create.sh
#
#					May/19/2011
#
#
#
# ---------------------------------------------------------------
function out_record ()
{
	echo ' <'$1'>'  >> $file_xml
	echo ' <name>'$2'</name>'  >> $file_xml
	echo ' <population>'$3'</population>'  >> $file_xml
	echo ' <date_mod>'$4'</date_mod>'  >> $file_xml
	echo ' </'$1'>'  >> $file_xml
}
#
# ---------------------------------------------------------------
function data_prepare
{
echo '<?xml version="1.0" standalone="yes"?>' > $file_xml
echo '<root>' >> $file_xml
#
out_record 't0271' '青森' 65800 '2001-7-9'
out_record 't0272' '弘前' 57400 '2001-8-25'
out_record 't0273' '八戸' 86700 '2001-3-12'
out_record 't0274' '三沢' 43800 '2001-4-14'
out_record 't0275' '黒石' 28200 '2001-5-21'
out_record 't0276' 'むつ' 35300 '2001-6-25'
out_record 't0277' '五所川原' 38500 '2001-8-9'
out_record 't0278' '十和田' 19400 '2001-9-15'
out_record 't0279' '平川' 28700 '2001-11-23'
#
echo '</root>' >> $file_xml
#
}

# ---------------------------------------------------------------
#
echo "Content-type: text/html"
echo ""
echo ""
#
file_xml='/tmp/cities_999.xml'
data_prepare
#
URL="http://cdbd026:8888/xindice/db/cities/cities"
curl -X PUT $URL -d@$file_xml
rm -f $file_xml
#
#
echo "*** OK ***"
#
# ----------------------------------------------------------------
# ---------------------------------------------------------------
