#! /usr/bin/coffee
# ---------------------------------------------------------------
#	sqlite3_read.coffee
#
#					Jul/20/2012
#
# ---------------------------------------------------------------
sqlite3 = require 'sqlite3'


# ---------------------------------------------------------------
row_display_proc = (row_in) ->
	out_str = row_in.id + "\t" + row_in.name
	out_str += "\t" + row_in.population
	out_str += "\t" + row_in.date_mod
	console.log out_str
# ---------------------------------------------------------------
select_proc = (db) ->
	db.each "SELECT id,name,population,date_mod FROM cities",
		(exeErr, row) ->
			row_display_proc(row)
# ---------------------------------------------------------------
console.log "*** 開始 ***"
file_sqlite3 = process.argv[2]

console.log (file_sqlite3)

db = new sqlite3.Database (file_sqlite3)
#
select_proc (db)
db.close
#
console.log "*** 終了 ***"
# ---------------------------------------------------------------
