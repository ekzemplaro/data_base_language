#! /bin/bash
#
#	riak_delete.sh
#					Mar/08/2013
#
# ------------------------------------------------------------
#
key_in=$1
#
echo "*** 開始 ***"
echo $key_in
#
url_target="http://localhost:8098/riak/shimane/"$key_in
#
curl -X DELETE $url_target
#
echo "*** 終了 ***"
# ------------------------------------------------------------
