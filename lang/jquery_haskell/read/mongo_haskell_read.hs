#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_python_read.py
#
#						May/10/2010
#
import sys
sys.path.insert (0,'/usr/local/lib/python2.6/dist-packages')
import pymongo
#
#sys.path.append ("/var/www/uchida/data_base/python_common")
#
#from mongo_manipulate import mongo_to_json_proc
#
# ----------------------------------------------------------------
def json_str_gen_proc ():
	str_aa='{"cities":[{"id":"921","name":"	横浜","population":"90345","date_mod":"2010-03-02"},'
	str_aa += '{"id":"922","name":"川崎","population":"15345","date_mod":"2010-01-05"},'

	str_aa += '{"id":"923","name":"小田原","population":"16345","date_mod":"2010-01-17"},'

	str_aa += '{"id":"924","name":"藤沢","population":"90345","date_mod":"2010-02-09"},'


	str_aa += '{"id":"925","name":"相模原","population":"90345","date_mod":"2010-02-22"},'

	str_aa += '{"id":"926","name":"厚木","population":"1009345","date_mod":"2010-02-14"}]}'
#
	return	str_aa
# ---------------------------------------------------------------------
# ----------------------------------------------------------------
#
#connection = pymongo.Connection("cpt003", 27017)
# db = connection.city_db
# json_str = mongo_to_json_proc (db)
print "Content-type: text/json\n\n"
#
json_str = json_str_gen_proc ()
print	json_str
#
