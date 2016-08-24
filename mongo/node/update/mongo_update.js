#! /usr/bin/nodejs
//
//	mongo_update.js
//
//					Aug/07/2016
// ----------------------------------------------------------------
var MongoClient = require('mongodb').MongoClient
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

console.log ("*** 開始 ***")

var key=process.argv[2]
var population_in=process.argv[3]

console.log (key + "\t" + population_in)

var host = 'localhost'
var port = 27017

var db_name = 'city_db'

var str_connect = "mongodb://" + host + ":" + port + "/" + db_name + "?w=1" 
console.log("Connecting to " + host + ":" + port)

MongoClient.connect (str_connect, function(err, db)
{
	var collection = db.collection('saitama')

	var population = population_in
	var date_mod = text_manipulate.get_current_date_proc ()

	collection.findOne ({key: key},function(err, item)
		{
		console.log ('err = ' + err)
		console.log ('item = ' + item)
		if (item == null)
			{
			db.close()
			console.log ('*** error *** ' + key + " doesn't exist.")
			db.close()
			console.log ("*** 終了 ***")
			}
		else
			{
		console.log (item.name)

		var name = item.name

	var doc = {'key': key, 'name': name,
			 'population': population,'date_mod': date_mod}

	collection.update({key: key}, doc, {w:1}, function(err,nn_updated)
		{
		db.close()

//		console.log (nn_updated)
		console.log ("*** 終了 ***")
		})
			}
		})
})

// ----------------------------------------------------------------
