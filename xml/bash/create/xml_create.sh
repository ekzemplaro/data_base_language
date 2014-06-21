#! /bin/bash
#
#	create/xml_create.sh
#
#					Aug/21/2011
#
# ---------------------------------------------------------------
file_xml=$1
#
#
function out_record
{
#	echo '<cities>'  >> $file_xml
	echo ' <'$id'>'  >> $file_xml
	echo ' <name>'$name'</name>'  >> $file_xml
	echo ' <population>'$population'</population>'  >> $file_xml
	echo ' <date_mod>'$date_mod'</date_mod>'  >> $file_xml
	echo ' </'$id'>'  >> $file_xml
#	echo '</cities>'  >> $file_xml
}
#
# ---------------------------------------------------------------
echo "*** 開始 ***"
#
echo '<root>' > $file_xml
#
id='t2261'
name='静岡'
population=15894
date_mod='2001-7-5'
out_record
#
id='t2262'
name='浜松'
population=32382
date_mod='2001-4-27'
out_record
#
id='t2263'
name='沼津'
population=82376
date_mod='2001-5-12'
out_record
#
id='t2264'
name='三島'
population=71425
date_mod='2001-6-23'
out_record
#
id='t2265'
name='富士'
population=62749
date_mod='2001-9-24'
out_record
#
id='t2266'
name='熱海'
population=52917
date_mod='2001-8-14'
out_record
#
id='t2267'
name='富士宮'
population=42341
date_mod='2001-7-12'
out_record
#
id='t2268'
name='藤枝'
population=32613
date_mod='2001-10-14'
out_record
#
id='t2269'
name='御殿場'
population=82691
date_mod='2001-9-19'
out_record
#
id='t2270'
name='島田'
population=72415
date_mod='2001-11-23'
out_record
#
#
echo '</root>' >> $file_xml
#
echo "*** 終了 ***"
# ---------------------------------------------------------------
#
