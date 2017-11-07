#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dynamo_export.py
#
#					Oct/30/2017
# --------------------------------------------------------------------
import	sys
import	json
import	boto3
import	decimal
# --------------------------------------------------------------------
sys.path.append('/var/www/data_base/common/python_common')
from file_io import file_write_proc
# --------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
file_out = sys.argv[1]
#
sys.stderr.write(file_out + "\n")
#
dynamodb = boto3.resource('dynamodb',endpoint_url="http://localhost:8000")

table_name = 'cities'
table = dynamodb.Table(table_name)

response = table.scan()
#

#print(response)

array_aa = []
for unit in response['Items']:
	str_out = ""
	unit_aa = {}
	for key in unit:
#		str_out += key + '\t'
		str_out += str(unit[key]) + '\t'
		if type(unit[key]) == str:
			unit_aa[key] = unit[key]
		elif type(unit[key]) == decimal.Decimal:
			str_tmp = str(unit[key])
			unit_aa[key] = int(str_tmp)
		else:
			sys.stderr.write(str(type(unit[key])) + '\n')
			unit_aa[key] = unit[key]
	array_aa.append(unit_aa)
	sys.stderr.write(str_out + '\n')
#
out_str=json.dumps(array_aa)
file_write_proc(file_out,out_str)
#
sys.stderr.write("*** 終了 ***\n")
# --------------------------------------------------------------------
