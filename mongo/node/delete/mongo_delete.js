#! /usr/bin/node
//
//	mongo_delete.js
//
//					May/03/2020
// ----------------------------------------------------------------
var MongoClient = require('mongodb').MongoClient
require('dotenv').config()

console.log ("*** 開始 ***")

var key=process.argv[2]

console.log (key)

const user = process.env.user
const password = process.env.password
const db_name = process.env.db
const collection_name = process.env.collection

const host = user + ':' + password + '@localhost'
const port = 27017

const url = 'mongodb://' + host + ':' + port

console.log("Connecting to " + host + ":" + port)

const client = new MongoClient(url,
    {useNewUrlParser: true,useUnifiedTopology: true})

client.connect (function(err)
{
	const db = client.db(db_name)
	const collection = db.collection(collection_name)

	collection.deleteOne({key: key}, function(err,result)
		{
		client.close()

		console.log ("*** 終了 ***")
		})
})

// ----------------------------------------------------------------
