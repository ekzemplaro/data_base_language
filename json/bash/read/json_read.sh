#! /bin/bash
#
#	json_read.sh
#
#					Mar/15/2013
#
# ---------------------------------------------------------------
file_json=$1
#
#
function read_record_proc
{
	nn=`cat $file_json | jq .$1.name`
	pp=`cat $file_json | jq .$1.population`
	dd=`cat $file_json | jq .$1.date_mod`
	echo $1"	"$nn"	"$pp"	"$dd
}
#
# ---------------------------------------------------------------
echo "*** 開始 ***"
cat $file_json | jq 'keys' | jq .[] | sed 's/"//g' | \
while read key
do
	read_record_proc $key
done
echo "*** 終了 ***"
#
# ---------------------------------------------------------------
