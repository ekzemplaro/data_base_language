#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	couch_read.js
//
//					Aug/03/2017
// ---------------------------------------------------------------
var cradle = require ('cradle')
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var name = 'nagano'
var cc = new (cradle.Connection)
var db = cc.database (name)

db.exists(function (err, exists)
	{
	if (err)
		{
		console.log('error', err)
		}
	else if (exists)
		{
		couchdb_fetch_proc (db)
		}
	else
		{
		console.log('database does not exists.')
		}
	})


// ---------------------------------------------------------------
function couchdb_fetch_proc (db)
{
	var dict_aa = new Object ()

	db.get ('_all_docs',function (err,docs)
		{
		console.log (docs.length)

		var it = 0
		docs.forEach(function(key,index)
			{
//			console.log(key)
			db.get (key,function (err,unit)
				{
				dict_aa [unit._id] = unit
				if (docs.length === (it + 1))
					{
					text_manipulate.dict_display_proc (dict_aa)
					console.log ("*** 終了 ***")
					}
				it += 1
				})
			})

		})
}

// ---------------------------------------------------------------
