#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dynamo_delete.py
#
#					Oct/21/2017
# --------------------------------------------------------------------
import sys
import boto3

# --------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
key_in = sys.argv[1]
print("%s" % key_in)

dynamodb = boto3.resource('dynamodb',endpoint_url="http://atami:8000")

table = dynamodb.Table('cities')

response = table.delete_item(
	Key={
            'key': key_in,
        }
)
#
sys.stderr.write("*** 終了 ***\n")
# --------------------------------------------------------------------
