#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	couch_update.js
//
//						Nov/24/2014
// ---------------------------------------------------------------
var cradle = require ('cradle');
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var key_in=process.argv[2];
var population_in=process.argv[3];

console.log (key_in + "\t" + population_in);

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
		db.get (key_in,function (err,unit)
			{
			if (unit)
				{
				console.log (key_in);
				unit.population =  population_in;
				unit.date_mod = text_manipulate.get_current_date_proc ();
				console.log (unit);

				db.put (key_in,unit,function (err,res)
					{
					console.log (res);
					});
				}
			});
		console.log ("*** 終了 ***");
		}
	else
		{
		console.log('database does not exists.');
		}
	});

// ---------------------------------------------------------------
