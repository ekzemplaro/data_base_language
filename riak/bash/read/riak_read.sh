#! /bin/bash
#
#	read/riak_read.sh
#					Feb/09/2015
#
# ------------------------------------------------------------
#
#
echo "*** 開始 ***"
#
url_base="http://host_ubuntu1:8098/riak/shimane"
#
curl $url_base"?keys=true" | jq  .keys[] > tmp001
#
awk '{print "curl http://host_ubuntu1:8098/riak/shimane/"$1}' tmp001 > go_tmp
#
bash ./go_tmp
echo "*** 終了 ***"
# ------------------------------------------------------------
