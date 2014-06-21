#! /bin/bash
#
#	webdav_create.sh
#
#					Sep/23/2013
#
# ---------------------------------------------------------------
HOST="host_dbase"
file_json='/tmp/iwate.json'
#
#
function out_record
{
	echo ' "'$id'":'  >> $file_json
	echo ' {"name": "'$name'",'  >> $file_json
	echo ' "population": '$population','  >> $file_json
	echo ' "date_mod": "'$date_mod'"}'  >> $file_json
}
#
# ---------------------------------------------------------------
function json_prepare
{
echo '{' > $file_json
#
id='t1351'
name='八王子'
population=35249
date_mod='2001-3-15'
out_record
echo ',' >> $file_json
#
id='t1352'
name='立川'
population=36458
date_mod='2001-7-21'
out_record
echo ',' >> $file_json
#
id='t1353'
name='武蔵野'
population=51672
date_mod='2001-5-24'
out_record
echo ',' >> $file_json
#
id='t1354'
name='三鷹'
population=72534
date_mod='2001-6-13'
out_record
echo ',' >> $file_json
#
id='t1355'
name='青梅'
population=41853
date_mod='2001-2-12'
out_record
echo ',' >> $file_json
#
id='t1356'
name='府中'
population=52716
date_mod='2001-8-14'
out_record
echo ',' >> $file_json
#
id='t1357'
name='昭島'
population=41679
date_mod='2001-7-5'
out_record
echo ',' >> $file_json
#
id='t1358'
name='調布'
population=37618
date_mod='2001-10-14'
out_record
echo ',' >> $file_json
#
id='t1359'
name='町田'
population=81795
date_mod='2001-4-9'
out_record
#
#
#
echo '}' >> $file_json
}

# ---------------------------------------------------------------
echo "*** 開始 ***"
url="http://host_dbase:3004/city/tokyo.json"
#
json_prepare
#
curl --noproxy $HOST -T $file_json $url
#
rm -f $file_json
#
echo "*** 終了 ***"

# ---------------------------------------------------------------
#
