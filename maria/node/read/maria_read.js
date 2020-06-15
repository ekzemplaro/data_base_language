#! /usr/bin/node
// ---------------------------------------------------------------
//	maria_read.js
//
//					Jun/14/2020
//
// ---------------------------------------------------------------
'use strict'

var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

var mysql = require('mysql')

var connection = mysql.createConnection ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger123'
	})

connection.query ('Use city')

connection.query("select * from cities", function (err, rows)
	{
  	if (err) throw err
  	console.log (rows.length)

	var dict_aa = new Object ()

	rows.forEach(function(row)
		{
		dict_aa[row.id] = {"name": row.name,
			"population": row.population,
			"date_mod": row.date_mod}
		})

	text_manipulate.dict_display_proc (dict_aa)

	connection.end()
	console.error ("*** 終了 ***")
	})

// ---------------------------------------------------------------
