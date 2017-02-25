#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# --------------------------------------------------------------------

from __future__ import print_function # Python 2/3 compatibility
import sys
import boto3
import json
import decimal
from boto3.dynamodb.conditions import Key, Attr

# --------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")

dynamodb = boto3.resource('dynamodb', region_name='us-west-2', \
	 endpoint_url="http://localhost:8000")

table = dynamodb.Table('cities')

key_search='t0921'

response = table.query(
    KeyConditionExpression=Key('key').eq(key_search)
)

for it in response['Items']:
	print (it['key'], "\t", it['name'],"\t",it['population'],"\t",it['date_mod'])

sys.stderr.write ("*** 終了 ***\n")
# --------------------------------------------------------------------
