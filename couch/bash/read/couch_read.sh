#! /bin/bash
#
#	read/couch_read.sh
#
#					Sep/23/2013
#
# ----------------------------------------------------------
HOST="host_dbase"
URL="http://host_dbase:5984/city/cities"
#
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
file_json="/tmp/tmp008234.json"
curl -X GET --noproxy $HOST  $URL > $file_json
#
cat $file_json | jq 'keys' | jq .[] | sed 's/"//g' | \
while read key
do
	if [ $key != "_id" -a $key != "_rev" ]
	then
		read_record_proc $key
	fi
done
#
rm -f $file_json
#
echo	"*** 終了 ***"
# ----------------------------------------------------------
