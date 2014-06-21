#! /usr/bin/coffee
#
#	mongo_update.coffee
#
#					Jun/04/2014
# ----------------------------------------------------------------
MongoClient = require('mongodb').MongoClient
text_manipulate=require ("/var/www/data_base/common/coffee_common/text_manipulate")

console.log "*** 開始 ***"

key=process.argv[2]
population_in=process.argv[3]

console.log key + "\t" + population_in

host = 'localhost'
port = 27017

db_name = 'city_db'

str_connect = "mongodb://" + host + ":" + port + "/" + db_name + "?w=1" 
console.log "Connecting to " + host + ":" + port

MongoClient.connect str_connect, (err, db) ->
	collection = db.collection('saitama')

	population = population_in
	date_mod = text_manipulate.get_current_date_proc()

	collection.findOne {key: key}, (err, item) ->
		console.log 'err = ' + err
		console.log 'item = ' + item
		if (item == null)
			console.log '*** error *** ' + key + " doesn't exist."
			db.close()
			console.log ("*** 終了 ***")
		else
			console.log item.name

			name = item.name

			doc = {'key': key, 'name': name, 'population': population,'date_mod': date_mod}

			collection.update {key: key}, doc, {w:1}, (err,nn_updated) ->
				db.close()

				console.log nn_updated
				console.log "*** 終了 ***"
#
# ----------------------------------------------------------------
