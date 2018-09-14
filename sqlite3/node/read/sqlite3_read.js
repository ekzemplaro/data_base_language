#! /usr/bin/node
//
//	sqlite3_read.js
//
//					Sep/14/2018
//
// ------------------------------------------------------------
const sqlite3 = require("sqlite3")

console.error ("*** 開始 ***")

const file_sqlite3 = process.argv[2]

console.log (file_sqlite3)

const db = new sqlite3.Database (file_sqlite3)

const command = "select id,name,population,date_mod from cities"

db.each (command,function (err,row)
	{
	var str_out = row.id + "\t" + row.name + "\t" + row.population
	str_out += "\t" + row.date_mod
	console.log (str_out)
	})

db.close ()

console.error ("*** 終了 ***")
// ------------------------------------------------------------
