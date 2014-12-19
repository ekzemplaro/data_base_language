#! /bin/bash
#
#	create/couch_create.sh
#
#					Nov/25/2014
#
# ---------------------------------------------------------------
URL="http://localhost:5984/nagano"
#
#
# ---------------------------------------------------------------
function put_json_proc
{
	json_str='{"name":"'$name'",'
	json_str=$json_str'"population":'$population','
	json_str=$json_str'"date_mod":"'$date_mod'"}'
#	echo $json_str
#
	curl -X PUT --noproxy '*' $URL"/"$key -d $json_str
}
#
# ---------------------------------------------------------------
function json_prepare
{
#
key='t2021'
name='長野'
population=94352
date_mod='2001-3-15'
put_json_proc
#
key='t2022'
name='松本'
population=86751
date_mod='2001-7-21'
put_json_proc
#
key='t2023'
name='上田'
population=52693
date_mod='2001-5-24'
put_json_proc
#
key='t2024'
name='小諸'
population=71584
date_mod='2001-6-13'
put_json_proc
#
key='t2025'
name='岡谷'
population=69741
date_mod='2001-2-12'
put_json_proc
#
key='t2026'
name='塩尻'
population=53918
date_mod='2001-8-14'
put_json_proc
#
key='t2027'
name='茅野'
population=47185
date_mod='2001-7-5'
put_json_proc
#
key='t2028'
name='飯田'
population=37615
date_mod='2001-10-14'
put_json_proc
#
key='t2029'
name='中野'
population=87495
date_mod='2001-9-9'
put_json_proc
#
key='t2030'
name='諏訪'
population=43716
date_mod='2001-11-23'
put_json_proc
#
key='t2031'
name='駒ヶ根'
population=59317
date_mod='2001-9-22'
put_json_proc
#
key='t2032'
name='佐久'
population=61845
date_mod='2001-8-25'
put_json_proc
#
key='t2033'
name='伊那'
population=83417
date_mod='2001-6-21'
put_json_proc
#
key='t2034'
name='千曲'
population=28971
date_mod='2001-5-14'
put_json_proc
#
}

# ---------------------------------------------------------------
echo "*** 開始 ***"
#
curl -X DELETE --noproxy '*' $URL
curl -X PUT --noproxy '*' $URL
#
json_prepare
#
echo "*** 終了 ***"
#
# ---------------------------------------------------------------
#
