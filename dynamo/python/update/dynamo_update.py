#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dynamo_update.py
#
#					Oct/21/2017
# --------------------------------------------------------------------
import sys
import datetime
from decimal import *
import boto3
from boto3.dynamodb.conditions import Key

# --------------------------------------------------------------------
def display_data_proc(key_in):
	response = table.query(
		KeyConditionExpression=Key('key').eq(key_in)
)
	for it in response['Items']:
		str_out = it['key'] + '\t'
		str_out += it['name'] + '\t'
		str_out += str (it['population']) + '\t'
		str_out += it['date_mod']
		print(str_out)
# --------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
key_in = sys.argv[1]
population_in = int(sys.argv[2])
print("%s\t%d" % (key_in, population_in))

dynamodb = boto3.resource('dynamodb',endpoint_url="http://atami:8000")

table = dynamodb.Table('cities')
#
#
display_data_proc(key_in)
#
response = table.update_item(Key={'key': key_in},
	UpdateExpression="SET population = :updated",
	ExpressionAttributeValues={':updated': Decimal (str(population_in))})
#
date_mod = '%s' % datetime.date.today()
response = table.update_item(Key={'key': key_in},
	UpdateExpression="SET date_mod = :updated",
	ExpressionAttributeValues={':updated': date_mod})
#
display_data_proc(key_in)
#
sys.stderr.write("*** 終了 ***\n")
# --------------------------------------------------------------------
