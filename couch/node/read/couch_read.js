#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	couch_read.js
//
//					Jun/10/2014
// ---------------------------------------------------------------
var cradle = require ('cradle');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
var name = 'nagano';
var cc = new (cradle.Connection);

var db = cc.database (name);

db.exists(function (err, exists)
	{
	if (err)
		{
		console.log('error', err);
		}
	else if (exists)
		{
		fetch_proc (db);
		}
	else
		{
		console.log('database does not exists.');
		}
	});

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
function fetch_proc (db)
{
	db.get ('_all_docs',function (err,doc)
		{
		for (var it in doc)
			{
			db.get (doc[it].key,function (err,unit)
				{
				var out_str = unit._id + '\t';
				out_str += unit.name + '\t';
				out_str += unit.population + '\t';
				out_str += unit.date_mod;
				console.log (out_str);
				});
			}
		});
}

// ---------------------------------------------------------------
