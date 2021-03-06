#! /bin/bash
#
#	read/couch_read.sh
#
#					Nov/25/2014
#
# ----------------------------------------------------------
URL="http://localhost:5984/nagano"
#
# ----------------------------------------------------------
function read_record_proc
{
	json_in=`curl -s -X GET --noproxy '*'  $URL"/"$key`
	nn=`echo $json_in | jq .name |  sed 's/"//g'`
	pp=`echo $json_in | jq .population |  sed 's/"//g'`
	dd=`echo $json_in | jq .date_mod |  sed 's/"//g'`
#
	echo $key"	"$nn"	"$pp"	"$dd
}
#
# ----------------------------------------------------------
echo	"*** 開始 ***"
#
json_in=`curl -s -X GET --noproxy '*'  $URL"/_all_docs"`
#
echo $json_in | jq .rows | jq .[] | jq .key | sed 's/"//g' | \
while read key
do
	read_record_proc $key
done
#
echo	"*** 終了 ***"
# ----------------------------------------------------------
