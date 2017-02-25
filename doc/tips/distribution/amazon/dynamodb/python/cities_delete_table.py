#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# --------------------------------------------------------------------
#from __future__ import print_function # Python 2/3 compatibility
import	sys
import boto3

sys.stderr.write ("*** 開始 ***\n")
dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url="http://localhost:8000")

table = dynamodb.Table('cities')

table.delete()
sys.stderr.write ("*** 終了 ***\n")
# --------------------------------------------------------------------
