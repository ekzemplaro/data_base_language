//
//	mongo_delete.ts
//
//					May/05/2020
// ----------------------------------------------------------------
var MongoClient = require('mongodb').MongoClient
require('dotenv').config()

console.log ("*** 開始 ***")

var key:string =process.argv[2]

console.log (key)

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

	collection.deleteOne({key: key}, function(err,result)
		{
		client.close()

		console.log ("*** 終了 ***")
		})
})

// ----------------------------------------------------------------
