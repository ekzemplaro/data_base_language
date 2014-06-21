#! /usr/bin/coffee
#
#	mongo_read.coffee
#
#					Jun/04/2014
# ----------------------------------------------------------------
MongoClient = require('mongodb').MongoClient

console.log "*** 開始 ***"

host = 'localhost'
port = 27017

db_name = 'city_db'

str_connect = "mongodb://" + host + ":" + port + "/" + db_name + "?w=1" 
out_str = "Connecting to " + host + ":" + port
console.log out_str

MongoClient.connect str_connect, (err, db) ->
	collection = db.collection('saitama')

	collection.find().each (err, item) ->
		if(item != null)
			str_out = item.key + "\t" + item.name
			str_out += "\t" + item.population
			str_out += "\t" + item.date_mod
			console.log str_out
		else
			db.close()
			console.log "*** 終了 ***"
#
# ----------------------------------------------------------------
