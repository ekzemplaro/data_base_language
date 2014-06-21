#! /bin/bash
#
#	couch_create.sh
#
#					Sep/24/2013
#
# ---------------------------------------------------------------
HOST="host_dbase"
file_json='/tmp/cities.json'
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
id='t2021'
name='長野'
population=14352
date_mod='2001-3-15'
out_record
echo ',' >> $file_json
#
id='t2022'
name='松本'
population=36751
date_mod='2001-7-21'
out_record
echo ',' >> $file_json
#
id='t2023'
name='上田'
population=52693
date_mod='2001-5-24'
out_record
echo ',' >> $file_json
#
id='t2024'
name='小諸'
population=72584
date_mod='2001-6-13'
out_record
echo ',' >> $file_json
#
id='t2025'
name='岡谷'
population=62741
date_mod='2001-2-12'
out_record
echo ',' >> $file_json
#
id='t2026'
name='塩尻'
population=52918
date_mod='2001-8-14'
out_record
echo ',' >> $file_json
#
id='t2027'
name='茅野'
population=42189
date_mod='2001-7-5'
out_record
echo ',' >> $file_json
#
id='t2028'
name='飯田'
population=37615
date_mod='2001-10-14'
out_record
echo ',' >> $file_json
#
id='t2029'
name='中野'
population=82495
date_mod='2001-9-9'
out_record
echo ',' >> $file_json
#
id='t2030'
name='諏訪'
population=42716
date_mod='2001-11-23'
out_record
echo ',' >> $file_json
#
id='t2031'
name='駒ヶ根'
population=52317
date_mod='2001-9-22'
out_record
echo ',' >> $file_json
#
id='t2032'
name='佐久'
population=61845
date_mod='2001-8-25'
out_record
echo ',' >> $file_json
#
id='t2033'
name='伊那'
population=83417
date_mod='2001-6-21'
out_record
echo ',' >> $file_json
#
id='t2034'
name='千曲'
population=28971
date_mod='2001-5-14'
out_record
#
echo '}' >> $file_json
}

# ---------------------------------------------------------------
echo "*** 開始 ***"
work_aa="/tmp/tmp0015"
work_bb="/tmp/tmp0016"
work_cc="/tmp/tmp0017"
#
#
url="http://host_dbase:5984/city/cities"
#
curl -X GET --noproxy $HOST $url > $work_aa
#
awk -F ',' '{print $2}' $work_aa > $work_bb
sed 's/"//g' $work_bb | sed 's/:/=/' | sed 's/_/?/' > $work_cc
url_del=$url`cat $work_cc`
echo $url_del
curl -X DELETE --noproxy $HOST $url_del
#
json_prepare
#
curl -X PUT --noproxy $HOST $url -d@$file_json
#
rm -f $work_aa
rm -f $work_bb
rm -f $work_cc
rm -f $file_json
#
echo "*** 終了 ***"
#
# ---------------------------------------------------------------
#
