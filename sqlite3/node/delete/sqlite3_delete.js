#! /usr/bin/node
//
//	sqlite3_delete.js
//
//					Sep/14/2018
//
// ------------------------------------------------------------
var sqlite3 = require("sqlite3")
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate')

// ------------------------------------------------------------
function delete_command_gen (id_in)
{
	const command = "delete from cities where id = '" + id_in + "'"

	console.log (command)

	return	command
}

// ------------------------------------------------------------
console.error ("*** 開始 ***")

const file_sqlite3 = process.argv[2]
const id_in=process.argv[3]

console.log (file_sqlite3)
console.log (id_in)

var db = new sqlite3.Database (file_sqlite3)

const command = delete_command_gen (id_in)

db.run (command)

db.close ()
console.error ("*** 終了 ***")
// ------------------------------------------------------------
