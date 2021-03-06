#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dynamo_create.py
#
#					Jul/04/2018
# ---------------------------------------------------------------
import	sys
import	boto3
from decimal import *
# ---------------------------------------------------------------
def insert_proc (key,name,population,date_mod):
	response = table.put_item ( \
	Item={'key': key,'name': name,'population': population,'date_mod':date_mod}
	)
# ---------------------------------------------------------------
def create_table_proc():
	table = dynamodb.create_table(
		TableName='cities',
		KeySchema=[
		{
		'AttributeName': 'key',
		'KeyType': 'HASH'  #Partition key
		},
		],
		AttributeDefinitions=[
			{'AttributeName': 'key', 'AttributeType': 'S' },
			],
		ProvisionedThroughput={
			'ReadCapacityUnits': 5,
			'WriteCapacityUnits': 5
			}
		)

	print("Table status:", table.table_status)
# ---------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")

dynamodb = boto3.resource('dynamodb',endpoint_url="http://localhost:8000")

create_table_proc()

table = dynamodb.Table('cities')

insert_proc ("t0921","宇都宮",Decimal ("45219"),"2003-9-18")
insert_proc ("t0922","小山",Decimal ("72814"),"2003-6-24")
insert_proc ("t0923","佐野",Decimal ("91845"),"2003-7-15")
insert_proc ("t0924","足利",Decimal ("59837"),"2003-6-9")
insert_proc ("t0925","日光",Decimal ("49871"),"2003-4-16")
insert_proc ("t0926","下野",Decimal ("39812"),"2003-10-8")

sys.stderr.write ("*** 終了 ***\n")
# ---------------------------------------------------------------
