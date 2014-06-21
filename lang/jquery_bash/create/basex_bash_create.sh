#! /bin/bash
#
#	basex_bash_create.sh
#
#					Jun/12/2012
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
out_record 't4161' '佐賀' 84200 '2001-3-9'
out_record 't4162' '唐津' 57400 '2001-5-25'
out_record 't4163' '鳥栖' 86700 '2001-7-12'
out_record 't4164' '多久' 43800 '2001-4-14'
out_record 't4165' '伊万里' 28200 '2001-5-21'
out_record 't4166' '武雄' 35300 '2001-6-25'
out_record 't4167' '鹿島' 38500 '2001-8-9'
out_record 't4168' '小城' 19400 '2001-9-15'
out_record 't4169' '嬉野' 28700 '2001-11-23'
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
file_xml='/tmp/cities_02999.xml'
data_prepare
#
URL="http://admin:admin@localhost:8984/rest/cities"
#
curl -X PUT $URL -T $file_xml
rm -f $file_xml
#
#
echo "*** OK ***"
#
# ----------------------------------------------------------------
# ---------------------------------------------------------------
