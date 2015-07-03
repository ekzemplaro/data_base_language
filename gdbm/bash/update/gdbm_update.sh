#! /bin/bash
#
#	gdbm_update.sh
#
#						Jun/09/2015
#
# --------------------------------------------------------------------------
#
echo "*** 開始 ***"
DBM_FILE=$1
KEY=$2
POPULATION=$3
TODAY=`date '+%F'`
#
echo $DBM_FILE
echo $KEY
echo $POPULATION
echo $TODAY
#
NAME=`dbm get $DBM_FILE $KEY | jq .name`
echo $NAME
#
JSON='{"name":'$NAME',"population":'$POPULATION',"date_mod":"'$TODAY'"}'
echo $JSON
#
dbm update $DBM_FILE $KEY $JSON
#
echo "*** 終了 ***"
#
# --------------------------------------------------------------------------
