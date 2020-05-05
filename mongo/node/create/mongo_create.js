#! /usr/bin/node
//
//	mongo_create.js
//
//					May/05/2020
//
// ----------------------------------------------------------------
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")
// ----------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1161','さいたま',93457,'1950-10-25')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1162','所沢',24657,'1950-8-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1163','越谷',93421,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1164','久喜',31864,'1950-6-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1165','熊谷',49358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1166','秩父',65792,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1167','川越',37251,'1950-7-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1168','和光',52386,'1950-4-20')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1169','新座',21893,'1950-6-24')
	
	return	dict_aa
}

// ----------------------------------------------------------------
const insertDocuments = function(collection,array_aa, callback) {
	collection.insertMany(array_aa,
		function(err, result) {
		assert.equal(err, null)
		console.log("*** Inserted to the collection ***")
		callback(result)
	})
}

// ----------------------------------------------------------------
function loop_insert_proc (dict_aa,collection)
{
	var array_aa = []

	for (var key in dict_aa)
		{
		const name = dict_aa[key].name
		const population = dict_aa[key].population
		const date_mod = dict_aa[key].date_mod
		const unit_aa = {'key': key, 'name': name,
			 'population': population,'date_mod': date_mod}
		array_aa = array_aa.concat(unit_aa)
		}

    console.log("*** check *** ppp ***")

//	console.log(array_aa)

insertDocuments(collection,array_aa, function() {
	console.log ("*** 終了 ***")
	client.close()
	})
}

// ----------------------------------------------------------------
const MongoClient = require('mongodb').MongoClient
const assert = require('assert')
require('dotenv').config()

console.log ("*** 開始 ***")

const user = process.env.user
const password = process.env.password
const db_name = process.env.db
const collection_name = process.env.collection

const host = user + ':' + password + '@localhost'
const port = 27017

const dict_aa = data_prepare_proc ()



const url = 'mongodb://' + host + ':' + port
console.log("Connecting to " + host + ":" + port)

const client = new MongoClient(url,
    {useNewUrlParser: true,useUnifiedTopology: true})

client.connect (function(err)
	{
	const db = client.db(db_name)
	db.dropDatabase(function(err, result)
		{
		const collection = db.collection(collection_name)
		collection.deleteOne ({},function (err, result)
			{
			loop_insert_proc (dict_aa,collection)
			})

		})
	})

// ----------------------------------------------------------------
