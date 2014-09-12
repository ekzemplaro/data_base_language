#! /bin/bash
#
#	delete/couch_delete.sh
#
#					Aug/21/2014
#
# ----------------------------------------------------------
HOST="localhost"
URL="http://"$HOST":5984/nagano"
#
# ----------------------------------------------------------
echo	"*** 開始 ***"
key_in=$1
echo $key_in
#
rev=`curl --noproxy $HOST $URL"/"$key_in | jq ._rev | sed 's/"//g'`
echo $rev
#
curl --noproxy $HOST -X DELETE $URL"/"$key_in"?rev="$rev
#
echo	"*** 終了 ***"
# ----------------------------------------------------------
