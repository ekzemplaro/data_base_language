#! /bin/bash
#
#	json_read.sh
#
#					Aug/21/2014
#
# ---------------------------------------------------------------
function read_record_proc
{
	nn=`echo $json_in | jq .$1.name | sed 's/"//g'`
	pp=`echo $json_in | jq .$1.population`
	dd=`echo $json_in | jq .$1.date_mod | sed 's/"//g'`
	echo $1"	"$nn"	"$pp"	"$dd
}
#
# ---------------------------------------------------------------
echo "*** 開始 ***"
file_json=$1
json_in=`cat $file_json`
echo $json_in | jq 'keys' | jq .[] | sed 's/"//g' | \
while read key
do
	read_record_proc $key
done
echo "*** 終了 ***"
#
# ---------------------------------------------------------------
