#! /bin/bash
#
#	delete/couch_delete.sh
#
#					Nov/25/2014
#
# ----------------------------------------------------------
URL="http://localhost:5984/nagano"
#
# ----------------------------------------------------------
echo	"*** 開始 ***"
key_in=$1
echo $key_in
#
rev=`curl --noproxy '*' $URL"/"$key_in | jq ._rev | sed 's/"//g'`
echo $rev
#
curl --noproxy '*' -X DELETE $URL"/"$key_in"?rev="$rev
#
echo	"*** 終了 ***"
# ----------------------------------------------------------
