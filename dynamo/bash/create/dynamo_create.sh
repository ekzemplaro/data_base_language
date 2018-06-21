#! /bin/bash
#
#	dynamo_create.sh
#
#				Jun/21/2018
#
# ---------------------------------------------------------------
ARGS="--table-name cities --endpoint-url http://localhost:8000"
#
aws dynamodb delete-table $ARGS
#
#
aws dynamodb create-table $ARGS \
--attribute-definitions '[{"AttributeName":"key","AttributeType": "S"}]' \
--key-schema '[{"AttributeName":"key","KeyType": "HASH"}]' \
--provisioned-throughput '{"ReadCapacityUnits": 5,"WriteCapacityUnits": 5}'
#
#
#
aws dynamodb put-item $ARGS \
--item '{ "population": { "N": "39164" }, "date_mod": { "S": "1950-6-22" }, "key": { "S": "t0924" }, "name": { "S": "足利" } }'
#
aws dynamodb put-item $ARGS \
--item '{ "population": { "N": "76391" }, "date_mod": { "S": "1950-8-30" }, "key": { "S": "t0925" }, "name": { "S": "日光" } }'
#
aws dynamodb put-item $ARGS \
--item '{ "population": { "N": "53148" }, "date_mod": { "S": "1950-9-7" }, "key": { "S": "t0926" }, "name": { "S": "下野" } }'
#
#
# ---------------------------------------------------------------
