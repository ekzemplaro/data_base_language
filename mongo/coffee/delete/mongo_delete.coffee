#! /usr/bin/coffee
#
#	mongo_delete.coffee
#
#					Jun/04/2014
# ----------------------------------------------------------------
MongoClient = require('mongodb').MongoClient

console.log "*** 開始 ***"

key=process.argv[2]

console.log key

host = 'localhost'
port = 27017

db_name = 'city_db'

str_connect = "mongodb://" + host + ":" + port + "/" + db_name + "?w=1" 
console.log "Connecting to " + host + ":" + port

MongoClient.connect str_connect, (err, db) ->
	collection = db.collection('saitama')
	collection.remove {key: key}, {w:1}, (err,nn_deleted) ->
		db.close()
		console.log nn_deleted
		console.log "*** 終了 ***"
#
# ----------------------------------------------------------------
