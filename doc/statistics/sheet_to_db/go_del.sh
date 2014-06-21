work_aa="/tmp/tmp0015"
work_bb="/tmp/tmp0016"
work_cc="/tmp/tmp0017"
#
url="http://cdbd026:5984/data_base/"$1
#url="http://localhost:5984/data_base/"$1
#
curl --silent -X GET $url > $work_aa
#
awk -F ',' '{print $2}' $work_aa > $work_bb
sed 's/"//g' $work_bb | sed 's/:/=/' | sed 's/_/?/' | \
		sed 's/}//' > $work_cc
url_del=$url`cat $work_cc`
echo $url_del
curl --silent -X DELETE $url_del
