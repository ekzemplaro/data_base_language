// ---------------------------------------------------------------
//	couch_delete.ts
//
//					Feb/09/2016
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var cradle = require ('cradle')
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var key_in: string=process.argv[2]

console.log (key_in)

var name = 'nagano'
var cc = new (cradle.Connection)

var db = cc.database (name)

db.get (key_in,function (err,unit_aa)
	{
	if (unit_aa)
		{
		console.log (unit_aa)

		db.remove (key_in,unit_aa._rev,function (err, res)
			{
			console.log (res)
			})
		}
	else
		{
		console.log ("*** key doesn't exist. ***")
		}
	})

// ---------------------------------------------------------------
