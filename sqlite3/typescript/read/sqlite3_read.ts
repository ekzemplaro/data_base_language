// ------------------------------------------------------------
//
//	sqlite3_read.ts
//
//					Feb/09/2016
//
// ------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;
var sqlite3 = require("sqlite3");

// ------------------------------------------------------------
console.log ("*** 開始 ***");

var file_sqlite3: string = process.argv[2];

console.log (file_sqlite3);

var db = new sqlite3.Database (file_sqlite3);

var command: string = "select id,name,population,date_mod from cities";

db.each (command,function (err,row)
	{
	var str_out:string  = row.id + "\t" + row.name + "\t" + row.population;
	str_out += "\t" + row.date_mod;
	console.log (str_out);
	});

db.close ();

console.log ("*** 終了 ***");
// ------------------------------------------------------------
