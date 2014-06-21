#! /usr/bin/nodejs
//
//	mongo_delete.js
//
//					Jun/04/2014
// ----------------------------------------------------------------
var MongoClient = require('mongodb').MongoClient;

console.log ("*** 開始 ***");

var key=process.argv[2];

console.log (key);

var host = 'localhost';
var port = 27017;

var db_name = 'city_db';

var str_connect = "mongodb://" + host + ":" + port + "/" + db_name + "?w=1"; 
console.log("Connecting to " + host + ":" + port);

MongoClient.connect (str_connect, function(err, db)
{
	var collection = db.collection('saitama');

	collection.remove({key: key}, {w:1}, function(err,nn_deleted)
		{
		db.close();

		console.log (nn_deleted);
		console.log ("*** 終了 ***");
		});
});

// ----------------------------------------------------------------
