#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dynamo_delete_table.py
#
#					Oct/27/2017
# --------------------------------------------------------------------
import	sys
import	boto3

# --------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
dynamodb = boto3.resource('dynamodb',endpoint_url="http://localhost:8000")
#
table_name = 'cities'
table = dynamodb.Table(table_name)

table.delete()

sys.stderr.write("*** 終了 ***\n")
# --------------------------------------------------------------------
