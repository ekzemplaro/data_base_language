#! /usr/bin/node
//
//	mongo_read.js
//
//					Jun/30/2018
// ----------------------------------------------------------------
var MongoClient = require('mongodb').MongoClient

console.log ("*** 開始 ***")

var host = 'scott:tiger123@localhost'
var port = 27017

var db_name = 'city'

var str_connect = "mongodb://" + host + ":" + port + "/" + db_name + "?w=1" 
console.log("Connecting to " + host + ":" + port)

MongoClient.connect (str_connect, function(err, db)
{
	var collection = db.collection('saitama')

collection.find().each(function(err, item)
	{
	if(item != null)
		{
//		console.dir(item)
		var str_out = item.key + "\t" + item.name
		str_out += "\t" + item.population
		str_out += "\t" + item.date_mod
		console.log (str_out)
		}
	else
		{
		db.close()
		console.log ("*** 終了 ***")
		}

	})
})
// ----------------------------------------------------------------
