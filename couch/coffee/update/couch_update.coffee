#! /usr/bin/coffee
# ---------------------------------------------------------------
#	couch_update.coffee
#
#					Jun/10/2014
# ---------------------------------------------------------------
cradle = require ('cradle')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

key_in=process.argv[2]
population_in=process.argv[3]

console.log (key_in + "\t" + population_in)

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
				console.log (key_in)
				unit.population =  population_in
				unit.date_mod =
					text_manipulate.get_current_date_proc()
				db.put key_in, unit, (err,res) ->
					console.log (res)

	else
		console.log('database does not exists.')
#
#
console.log "*** 終了 ***"

# ---------------------------------------------------------------
