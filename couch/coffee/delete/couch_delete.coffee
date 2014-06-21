#! /usr/bin/coffee
# ---------------------------------------------------------------
#	couch_delete.coffee
#
#					Jun/10/2014
# ---------------------------------------------------------------
cradle = require ('cradle')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

key_in=process.argv[2]

console.log (key_in)

name = 'nagano'
cc = new (cradle.Connection)

db = cc.database (name)

db.exists (err, exists) ->
	if err
		console.log('error', err)
	else if exists
		console.log (exists)
		db.get key_in, (err,unit) ->
			if (unit)
				console.log (unit)
				db.remove key_in,unit._rev, (err,res) ->
					console.log (res)
			else
				console.log('key does not exists.')
	else
		console.log('database does not exists.')

console.log "*** 終了 ***"
# ---------------------------------------------------------------
