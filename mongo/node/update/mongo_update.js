#! /usr/bin/node
//
//	mongo_update.js
//
//					May/03/2020
// ----------------------------------------------------------------
var MongoClient = require('mongodb').MongoClient
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")
require('dotenv').config()


console.log ("*** 開始 ***")

const key=process.argv[2]
const population_in=parseInt(process.argv[3])

console.log (key + "\t" + population_in)

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

	const date_mod = text_manipulate.get_current_date_proc ()

	collection.findOne ({key: key},function(err, item)
		{
		console.log ('err = ' + err)
		if (item == null)
			{
			client.close()
			console.log ('*** error *** ' + key + " doesn't exist.")
			console.log ("*** 終了 ***")
			}
		else
			{
			console.log (item.name)

	collection.updateOne({key: key},{ $set:  {'population': population_in,'date_mod': date_mod}},function(err,result)
		{
		client.close()

		console.log (err)
//		console.log (result)
		console.log ("*** 終了 ***")
		})
			}
		})
})

// ----------------------------------------------------------------
