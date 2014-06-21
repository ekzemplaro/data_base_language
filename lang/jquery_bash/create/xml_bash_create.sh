#! /bin/bash
#
#	xml_bash_create.sh
#
#					May/06/2011
#
# --------------------------------------------------------
function out_record ()
{
	echo ' <'$1'>'  >> $file_xml
	echo ' <name>'$2'</name>'  >> $file_xml
	echo ' <population>'$3'</population>'  >> $file_xml
	echo ' <date_mod>'$4'</date_mod>'  >> $file_xml
	echo ' </'$1'>'  >> $file_xml
}
#
#
#
#
# --------------------------------------------------------
function data_out
{
echo '<root>' > $file_xml
#
out_record 't2261' '静岡' 94800 '2001-7-5'
out_record 't2262' '浜松' 23900 '2001-2-12'
out_record 't2263' '沼津' 86300 '2001-9-14'
out_record 't2264' '三島' 67200 '2001-8-9'
out_record 't2265' '富士' 45700 '2001-5-15'
out_record 't2266' '熱海' 34500 '2001-3-17'
out_record 't2267' '富士宮' 79500 '2001-6-25'
out_record 't2268' '藤枝' 28500 '2001-10-24'
out_record 't2269' '御殿場' 16500 '2001-2-18'
out_record 't2270' '島田' 84700 '2001-5-20'
#
echo '</root>' >> $file_xml
#
}
# --------------------------------------------------------

#
echo "Content-type: text/html"
echo ""
echo ""
#
file_xml="/var/tmp/xml_file/cities.xml"
data_out
#
echo "*** OK ***"
#
