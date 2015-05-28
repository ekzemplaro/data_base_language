#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_python_read.py
#
#					May/12/2015
#
# ----------------------------------------------------------------
import	sys
import	string
import	pymongo
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_to_dict_proc
# ----------------------------------------------------------------
def json_str_gen_proc ():
	str_aa='{"t0921": {"name":"横浜","population":51345,"date_mod":"2003-3-2"},'
	str_aa += '"t0922": {"name":"川崎","population":42356,"date_mod":"2003-5-15"},'
	str_aa += '"t0923": {"name":"小田原","population":76391,"date_mod":"2003-1-17"},'

	str_aa += '"t0924": {"name":"藤沢","population":98342,"date_mod":"2003-2-9"},'
	str_aa += '"t0925": {"name":"相模原","population":19345,"date_mod":"2003-9-14"}}'
#
	return	str_aa
# ---------------------------------------------------------------------
#
client = pymongo.MongoClient()
db = client['city_db']
#
#json_str = json_str_gen_proc ()
#print	json_str
#
dict_aa = mongo_to_dict_proc (db)
#
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
print	(str_aa)
#
# ----------------------------------------------------------------
