// ------------------------------------------------------------
//
//	sqlite3_delete.ts
//
//					Feb/09/2016
//
// ------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var sqlite3 = require("sqlite3");
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate');

// ------------------------------------------------------------
function delete_command_gen (id_in)
{
	var command: string = "delete from cities where id = '" + id_in + "'"
	console.log (command);

	return	command;
}

// ------------------------------------------------------------
console.log ("*** 開始 ***");

var file_sqlite3:string = process.argv[2];
var id_in: string =process.argv[3];

console.log (file_sqlite3);
console.log (id_in);

var db = new sqlite3.Database (file_sqlite3);

var command: string = delete_command_gen (id_in);

db.run (command);

db.close ();
console.log ("*** 終了 ***");
// ------------------------------------------------------------
