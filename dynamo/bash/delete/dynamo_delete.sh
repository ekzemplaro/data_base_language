#! /bin/bash
#
#	dynamo_delete.sh
#
# ---------------------------------------------------------------
ARGS="--table-name cities --endpoint-url http://localhost:8000"
#
key_in=$1
echo $key_in
#
aws dynamodb delete-item --key '{"key": {"S": "'$key_in'"}}' $ARGS
#
# ---------------------------------------------------------------
