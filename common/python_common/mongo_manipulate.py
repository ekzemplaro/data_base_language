# -*- coding: utf-8 -*-
#
#	mongo_manipulate.py
#
#					Jul/01/2018
#
import	pymongo
import	datetime
#
from text_manipulate import dict_append_proc
# -------------------------------------------------------------------
def	mongo_update_proc (db_aa,collection,key_in,population_in):
#	collection = "saitama"
	date_mod = datetime.datetime.now ()
	for item in db_aa[collection].find().sort("key", pymongo.ASCENDING):
		if (key_in == item["key"]):
			item["population"] = population_in
			item["date_mod"] = '%s' % date_mod
			print ("** found **",item["key"],item["population"])
			db_aa[collection].save (item)
#
# -------------------------------------------------------------------
def	mongo_delete_proc (db_aa,collection,key_in):
#	collection = "saitama"
	for item in db_aa[collection].find().sort("key", pymongo.ASCENDING):
		if (key_in == item["key"]):
			print (item["key"],item["population"])
			db_aa[collection].remove (item)
#
# -------------------------------------------------------------------
def	mongo_to_dict_proc (db_aa,collection):
#
#	collection = "saitama"
#
	dict_aa = {}

	for item in db_aa[collection].find().sort("key", pymongo.ASCENDING):
		dict_aa = dict_append_proc (dict_aa,item["key"],item["name"],item["population"],item["date_mod"])
#
	return	dict_aa
#
# -------------------------------------------------------------------
def dict_to_mongo_proc (db_aa,collection,dict_aa):
#
#	collection = "saitama"
	db_aa[collection]
	db_aa[collection].remove ()
#
	for key in dict_aa.keys():
		unit = dict_aa[key]
		db_aa[collection].save({"key": key,"name": unit['name'],"population": unit['population'],"date_mod": unit['date_mod']})
#
# -------------------------------------------------------------------
