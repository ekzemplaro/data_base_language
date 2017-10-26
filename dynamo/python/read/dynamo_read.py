#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dynamo_read.py
#
#					Oct/21/2017
# --------------------------------------------------------------------
import	sys
import	boto3

sys.stderr.write("*** 開始 ***\n")

dynamodb = boto3.resource('dynamodb',endpoint_url="http://atami:8000")

table = dynamodb.Table('cities')

response = table.scan()

for it in response['Items']:
	str_out = it['key'] + '\t'
	str_out += it['name'] + '\t'
	str_out += str (it['population']) + '\t'
	str_out += it['date_mod']
	print(str_out)
#
sys.stderr.write("*** 終了 ***\n")
# --------------------------------------------------------------------
