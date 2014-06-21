#! /bin/bash
#
#	riak_read.sh
#					Aug/09/2013
#
# ------------------------------------------------------------
#
#
echo "*** 開始 ***"
#
url_base="http://localhost:8098/riak/shimane"
#
curl $url_base"?keys=true" | jq  .keys[] > tmp001
#
awk '{print "curl http://localhost:8098/riak/shimane/"$1}' tmp001 > go_tmp
#
bash ./go_tmp
echo "*** 終了 ***"
# ------------------------------------------------------------
