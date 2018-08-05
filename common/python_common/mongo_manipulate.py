# -*- coding: utf-8 -*-
#
#	mongo_manipulate.py
#
#					Aug/05/2018
#
import	pymongo
import	datetime
#
from text_manipulate import dict_append_proc
# -------------------------------------------------------------------
def	mongo_update_proc (db_aa,collection,key_in,population_in):
	date_mod = datetime.datetime.now ()
	db_aa[collection].update({"key": key_in},{"$set":{"population": population_in,"date_mod": '%s' % date_mod}})
#
# -------------------------------------------------------------------
def	mongo_delete_proc (db_aa,collection,key_in):
	db_aa[collection].remove ({"key": key_in})
#
# -------------------------------------------------------------------
def	mongo_to_dict_proc (db_aa,collection):
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
	db_aa[collection]
	db_aa[collection].remove ()
#
	for key in dict_aa.keys():
		unit = dict_aa[key]
		db_aa[collection].save({"key": key,"name": unit['name'],"population": unit['population'],"date_mod": unit['date_mod']})
#
# -------------------------------------------------------------------
