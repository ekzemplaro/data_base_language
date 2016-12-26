#! /usr/bin/nodejs
//
//	sqlite3_update.js
//
//					Dec/26/2016
//
// ------------------------------------------------------------
var sqlite3 = require("sqlite3")
var text_manipulate= require ('/var/www/data_base/common/node_common/text_manipulate')

// ------------------------------------------------------------
function update_command_gen (id_in,population_in)
{
	const today = text_manipulate.get_current_date_proc()
	var command = "update cities set population = " + population_in
	command += " , date_mod = '" + today + "'"
	command += " where id = '" + id_in + "'"
	console.log (command)

	return	command
}

// ------------------------------------------------------------
console.log ("*** 開始 ***")

const file_sqlite3 = process.argv[2]
const id_in=process.argv[3]
const population_in=process.argv[4]

console.log (file_sqlite3)
console.log (id_in + "\t" + population_in)

var db = new sqlite3.Database (file_sqlite3)

const command = update_command_gen (id_in,population_in)

db.run (command)

db.close ()

console.log ("*** 終了 ***")
// ------------------------------------------------------------
