// ---------------------------------------------------------------
//	couch_read.ts
//
//					Feb/09/2016
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var cradle = require ('cradle')
var underscore = require('underscore')
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
console.log ("*** 開始 ***")
var name: string = 'nagano'
var cc = new (cradle.Connection) ('http://localhost', 5984, {
      cache: true,
      raw: false,
      forceSave: true,
      request: {
        //Pass through configuration to `request` library for all requests on this connection. 
      }
  })


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

	db.get ('_all_docs',function (err,doc)
		{
		var displayResult  = underscore.after(doc.length, function()
			{
			text_manipulate.dict_display_proc (dict_aa)
			console.log ("*** 終了 ***")
			})

		console.log (doc.length)

		for (var it in doc)
			{
			db.get (doc[it].key,function (err,unit)
				{
				dict_aa [unit._id] = unit
				displayResult()
				})
			}

		})
}

// ---------------------------------------------------------------
