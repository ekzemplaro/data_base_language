#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#
# ---------------------------------------------------------------
import	sys
import	boto3
import json
# ---------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")

dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url="http://localhost:8000")

table = dynamodb.Table('cities')

name = "宇都宮"
key = "t0921"

response = table.put_item(
   Item={
        'key': key,
        'name': name,
	'population': 345698,
	'date_mod': '2013-5-7'
        }
)

print("PutItem succeeded:")
sys.stderr.write ("*** 終了 ***\n")
# print(json.dumps(response, indent=4, cls=DecimalEncoder))
# ---------------------------------------------------------------
