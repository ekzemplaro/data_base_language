#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# --------------------------------------------------------------------
#from __future__ import print_function # Python 2/3 compatibility
import sys
import boto3

import sys
#

sys.stderr.write ("*** 開始 ***\n")

dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url="http://localhost:8000")



table = dynamodb.create_table(
    TableName='cities',
    KeySchema=[
        {
            'AttributeName': 'key',
            'KeyType': 'HASH'  #Partition key
        },
	{
            'AttributeName': 'name',
            'KeyType': 'RANGE'  #Sort key
        }
    ],
    AttributeDefinitions=[
        {
            'AttributeName': 'key',
            'AttributeType': 'S'
        },
        {
            'AttributeName': 'name',
            'AttributeType': 'S'
        },
    ],
    ProvisionedThroughput={
        'ReadCapacityUnits': 10,
        'WriteCapacityUnits': 10
    }
)

print("Table status:", table.table_status)
sys.stderr.write ("*** 終了 ***\n")
# --------------------------------------------------------------------
