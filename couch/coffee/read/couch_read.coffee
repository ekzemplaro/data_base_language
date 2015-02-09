#! /usr/bin/coffee
# ---------------------------------------------------------------
#	couch_read.coffee
#
#					Jan/19/2015
# ---------------------------------------------------------------
cradle = require ('cradle')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

name = 'nagano'
cc = new (cradle.Connection)

db = cc.database (name)

db.exists (err, exists) ->
	if err
		console.log('error', err)
	else if exists
		console.log (exists)
		fetch_proc (db)
	else
		console.log('database does not exists.')
#
#
# ---------------------------------------------------------------
fetch_proc = (db) ->
	db.get '_all_docs', (err,doc) ->
		for it of doc
#			console.log (it)
#			console.log (doc[it])
			db.get doc[it].key, (err,unit) ->
#				console.log (unit)
				out_str = unit._id + '\t'
				out_str += unit.name + '\t'
				out_str += unit.population + '\t'
				out_str += unit.date_mod
				console.log (out_str)
		console.log ("*** 終了 ***")
# ---------------------------------------------------------------
