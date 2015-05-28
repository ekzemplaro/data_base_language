# -*- coding: utf-8 -*-
#
#	mongo_manipulate.py
#
#					May/12/2015
#
import	pymongo
import	datetime
#
from text_manipulate import dict_append_proc
# -------------------------------------------------------------------
def	mongo_update_proc (db_aa,key_in,population_in):
	print ("*** mongo_update_proc ***")
	date_mod = datetime.datetime.now ()
	for item in db_aa.saitama.find().sort("key", pymongo.ASCENDING):
		if (key_in == item["key"]):
			item["population"] = population_in
			item["date_mod"] = '%s' % date_mod
			print ("** found **",item["key"],item["population"])
			db_aa.saitama.save (item)
	print ("*** mongo_update_proc *** end ***")
#
# -------------------------------------------------------------------
def	mongo_delete_proc (db_aa,key_in):
	print ("*** mongo_delete_proc ***")
	for item in db_aa.saitama.find().sort("key", pymongo.ASCENDING):
		if (key_in == item["key"]):
			print (item["key"],item["population"])
			db_aa.saitama.remove (item)
	print ("*** mongo_delete_proc *** end ***")
#
# -------------------------------------------------------------------
def	mongo_to_dict_proc (db_aa):
#
	dict_aa = {}

	for item in db_aa.saitama.find().sort("key", pymongo.ASCENDING):
		dict_aa = dict_append_proc (dict_aa,item["key"],item["name"],item["population"],item["date_mod"])
#
	return	dict_aa
#
# -------------------------------------------------------------------
def dict_to_mongo_proc (dict_aa):
	client = pymongo.MongoClient()
	db = client['city_db']
#
	db.saitama
	db.saitama.remove ()
#
	for key in dict_aa.keys():
		unit = dict_aa[key]
		db.saitama.save({"key": key,"name": unit['name'],"population": unit['population'],"date_mod": unit['date_mod']})
#
# -------------------------------------------------------------------
