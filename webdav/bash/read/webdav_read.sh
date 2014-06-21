#!/bin/bash
#
#	read/webdav_read.sh
#
#					Sep/24/2013
#
# ----------------------------------------------------------
HOST="host_dbase"
URL="http://host_dbase:3004/city/tokyo.json"
#
export http_proxy=""
export ftp_proxy=""
# ----------------------------------------------------------
function read_record_proc
{
	nn=`cat $file_json | jq .$1.name`
	pp=`cat $file_json | jq .$1.population`
	dd=`cat $file_json | jq .$1.date_mod`
	echo $1"	"$nn"	"$pp"	"$dd
}
#
# ----------------------------------------------------------
echo	"*** 開始 ***"
#
file_json="/tmp/tmp005284.json"
curl -X GET --noproxy $HOST $URL > $file_json
#
cat $file_json | jq 'keys' | jq .[] | sed 's/"//g' | \
while read key
do
	read_record_proc $key
done
#
rm -f $file_json
#
echo	"*** 終了 ***"
# ----------------------------------------------------------
