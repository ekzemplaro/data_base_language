#! /usr/bin/nodejs
// --------------------------------------------------------------
//
//	to_couchdb.js
//
//					Jul/10/2014
//
//
// --------------------------------------------------------------
var fs = require("fs");
var cradle = require ('cradle');

console.log ("*** 開始 ***");

var url_base = "http://localhost:5984/librivox_books/";

var db_name = 'librivox_books';
var db = new (cradle.Connection)('http://localhost',5984).database (db_name);


var list_in = process.argv[2];

var data = fs.readFileSync (list_in,'utf8');
var lines_in = ("" + data).split ("\n");

for (var it in lines_in)
	{
var key_in = lines_in[it];
	if (2 < key_in.length)
		{
//		console.log (key_in);
		var file_in= "data/" + key_in + ".json";

//		console.log (file_in);

		var json_str = fs.readFileSync (file_in,'utf8');
		var data_aa = JSON.parse (json_str);
		single_register_proc (db,data_aa);
		}
	}

console.log ("*** 終了 ***");
 
// --------------------------------------------------------------
function single_register_proc (db,data_aa)
{
for (var it in data_aa.books)
	{
	console.log (key_in + "\t" + data_aa.books[it].title);

	var key_register = key_in;

	if (key_register.length < 6)
		{
		key_register = key_in.substr (0,3) + "00" + key_in.substr (3)
		}
	else if (key_register.length < 7)
		{
		key_register = key_in.substr (0,3) + "0" + key_in.substr (3)
		}

	db.put (key_register,data_aa.books[it],function (err,res){
		console.log (res);
		});

	}
}

// --------------------------------------------------------------

