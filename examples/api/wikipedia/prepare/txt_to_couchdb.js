#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	txt_to_couchdb.js
//
//					Apr/24/2015
//
// ---------------------------------------------------------------
var fs = require("fs");
var cradle = require ('cradle');

// ---------------------------------------------------------------
function convert_proc (file_in)
{
	var data_aa = new Object ();

	var data = fs.readFileSync (file_in,'utf8');

	var lines_in = ("" + data).split ("\n");

	for (var it in lines_in)
		{
		var line = lines_in[it]; 
		if (line.substring (0,1) != "#")
			{
			if (2 < line.length)
				{
				var rr = line.split ("\t");

				data_aa[rr[0]] = {"status": rr[1],
				"reporter": rr[2]};
				}
			}

//		console.log (it);
		}

	return	data_aa;
}

// ---------------------------------------------------------------
function file_write_proc (file_json,json_str)
{
	fs.writeFile (file_json,json_str,function (err)
	{
	if (err) {
		console.log ("Error on write: " + err)
		}
	else {
		fs.chmodSync (file_json,0666);
		console.log ("File written.");
		console.log ("*** 終了 ***");
		}
	});
}

// ---------------------------------------------------------------
function to_couchdb_proc (db,key,value)
{
	db.put (key,value,function (err,res)
			{
//			console.log (err);
			console.log (res);
			});
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//
var file_in=process.argv[2];

console.log (file_in);

var db_name = 'wikipedia';
var cc = new (cradle.Connection);

var db = cc.database (db_name);

if (fs.existsSync(file_in))
	{
	var data_aa = convert_proc (file_in);
	console.log ("*** ddd ***");

	for (var key in data_aa)
		{
		var value = data_aa[key];
		to_couchdb_proc (db,key,value);
		}
	}
else
	{
	console.log ("*** error *** " + file_in + " doesn't exist. ***");
	}
// ---------------------------------------------------------------

