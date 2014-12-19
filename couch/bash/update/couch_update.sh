#! /bin/bash
#
#	update/couch_update.sh
#
#					Nov/25/2014
#
# ----------------------------------------------------------
URL="http://localhost:5984/nagano"
#
# ----------------------------------------------------------
echo	"*** 開始 ***"
key_in=$1
population_in=$2
echo $key_in,$population_in
#
json_in=`curl --noproxy '*' $URL"/"$key_in`
echo $json_in
rev=`echo $json_in | jq ._rev | sed 's/"//g'`
echo $rev
name=`echo $json_in | jq .name | sed 's/"//g'`
echo $name
today=`date '+%F'`
echo $today
#
json_str='{"name":"'$name'",'
json_str=$json_str'"population":'$population_in','
json_str=$json_str'"date_mod":"'$today'"}'
echo $json_str
#
curl --noproxy '*' -X PUT $URL"/"$key_in"?rev="$rev -d $json_str
#
echo	"*** 終了 ***"
# ----------------------------------------------------------
