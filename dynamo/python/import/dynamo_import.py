#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dynamo_import.py
#
#					Oct/30/2017
# ---------------------------------------------------------------
import	sys
import	json
import	boto3
from decimal import *
# ---------------------------------------------------------------
sys.path.append('/var/www/data_base/common/python_common')
from file_io import file_to_str_proc
# ---------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
file_in = sys.argv[1]
#
sys.stderr.write(file_in + "\n")
#
try:
	json_str = file_to_str_proc(file_in)
except Exception as ee:
	sys.stderr.write("*** error *** in file_to_str_proc ***\n")
	sys.stderr.write(str(ee) + "\n")
#
dict_aa = json.loads(json_str)
#
#
dynamodb = boto3.resource('dynamodb',endpoint_url="http://localhost:8000")


table_name = 'cities'
table = dynamodb.Table(table_name)

for unit_aa in dict_aa:
	print(unit_aa)
	response = table.put_item ( \
	Item=unit_aa
	)
#
sys.stderr.write ("*** 終了 ***\n")
# ---------------------------------------------------------------
