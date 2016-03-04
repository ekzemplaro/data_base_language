// ------------------------------------------------------------
//
//	sqlite3_update.ts
//
//					Feb/09/2016
//
// ------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;
var sqlite3 = require("sqlite3");
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate');

// ------------------------------------------------------------
function update_command_gen (id_in,population_in)
{
	var today = text_manipulate.get_current_date_proc();
	var command: string = "update cities set population = " + population_in
	command += " , date_mod = '" + today + "'"
	command += " where id = '" + id_in + "'"
	console.log (command);

	return	command;
}

// ------------------------------------------------------------
console.log ("*** 開始 ***");

var file_sqlite3: string = process.argv[2];
var id_in: string =process.argv[3];
var population_in=process.argv[4];

console.log (file_sqlite3);
console.log (id_in + "\t" + population_in);

var db = new sqlite3.Database (file_sqlite3);

var command: string = update_command_gen (id_in,population_in);

db.run (command);

db.close ();

console.log ("*** 終了 ***");
// ------------------------------------------------------------
