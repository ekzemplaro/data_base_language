//
//	mongo_read.ts
//
//					May/05/2020
// ----------------------------------------------------------------
const MongoClient = require('mongodb').MongoClient
const assert = require('assert')
require('dotenv').config()

console.log ("*** 開始 ***")

const user:string = process.env.user
const password:string = process.env.password
const db_name:string = process.env.db
const collection_name:string = process.env.collection

const host:string = user + ':' + password + '@localhost'
const port:number = 27017

const url:string = 'mongodb://' + host + ':' + port

console.log("Connecting to " + host + ":" + port)

const client = new MongoClient(url,
    {useNewUrlParser: true,useUnifiedTopology: true})

client.connect (function(err)
{
	const db = client.db(db_name)

	const collection = db.collection(collection_name)

collection.find().each(function(err, item)
	{
	if(item != null)
		{
		var str_out = item.key + "\t" + item.name
		str_out += "\t" + item.population
		str_out += "\t" + item.date_mod
		console.log (str_out)
		}
	else
		{
		console.log ("*** 終了 ***")
		}

        client.close()
	})

})
// ----------------------------------------------------------------
