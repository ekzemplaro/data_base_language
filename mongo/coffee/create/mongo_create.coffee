#! /usr/bin/coffee
#
#	mongo_create.coffee
#
#					Jun/04/2014
#
# ----------------------------------------------------------------
text_manipulate=require ("/var/www/data_base/common/coffee_common/text_manipulate")
# ----------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1161','さいたま',93714,'1954-4-13')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1162','所沢',21657,'1954-7-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1163','越谷',68941,'1954-9-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1164','久喜',37864,'1954-10-18')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1165','熊谷',41358,'1954-6-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1166','秩父',65392,'1954-5-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1167','川越',38751,'1954-2-25')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1168','和光',52186,'1954-8-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1169','新座',21957,'1954-12-14')
	
	return	dict_aa

# ----------------------------------------------------------------
loop_insert_proc = (dict_aa,collection) ->
	for key of dict_aa
		name = dict_aa[key].name
		population = dict_aa[key].population
		date_mod = dict_aa[key].date_mod
		document = {'key': key, 'name': name,'population': population,'date_mod': date_mod}
		collection.insert(document, {w:0})

# ----------------------------------------------------------------
MongoClient = require('mongodb').MongoClient

console.log "*** 開始 ***"

dict_aa = data_prepare_proc()

host = 'localhost'
port = 27017

db_name = 'city_db'

str_connect = "mongodb://" + host + ":" + port + "/" + db_name + "?w=1" 
console.log "Connecting to " + host + ":" + port

MongoClient.connect str_connect, (err, db) ->
	db.dropDatabase (err, result) ->
		collection = db.collection('saitama')

		collection.remove {}, (err, result) ->
			loop_insert_proc(dict_aa,collection)

			db.close()
			console.log "*** 終了 ***"
#
# ----------------------------------------------------------------
