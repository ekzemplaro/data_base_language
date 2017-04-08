#! /usr/bin/coffee
# ---------------------------------------------------------------
#	maria_read.coffee
#
#					Apr/07/2017
#
# ---------------------------------------------------------------
row_display_proc = (row_in) ->
	out_str = row_in.id + "\t" + row_in.name
	out_str += "\t" + row_in.population
	out_str += "\t" + row_in.date_mod
	console.log out_str
# ---------------------------------------------------------------
console.log "*** 開始 ***"

mysql = require('mysql')

connection = mysql.createConnection ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger123'
	})

connection.query ('Use city')
#
connection.query("select * from cities", (err, rows) ->
	console.log "rows.length = " + rows.length
	for it in [0 .. (rows.length - 1)]
		row_display_proc (rows[it])
	console.log "*** 終了 ***"
	)

connection.end()

# ---------------------------------------------------------------
