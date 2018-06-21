#! /bin/bash
#
#	dynamo_read.sh
#
#					Jun/20/2018
# ---------------------------------------------------------------
ARGS="--table-name cities --endpoint-url http://localhost:8000"
#
# ---------------------------------------------------------------
function read_unit_proc
{
	aa=`aws dynamodb scan $ARGS | jq .Items | jq .[$1]`
	key=`echo $aa | jq .key.S`
	name=`echo $aa | jq .name.S`
	population=`echo $aa | jq .population.N`
	date_mod=`echo $aa | jq .date_mod.S`
	echo $key"	"$name"	"$population"	"$date_mod
}

# ---------------------------------------------------------------
#
read_unit_proc 0
read_unit_proc 1
read_unit_proc 2
#
# ---------------------------------------------------------------
