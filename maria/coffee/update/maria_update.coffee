#! /usr/bin/coffee
# ---------------------------------------------------------------
#	maria_update.coffee
#
#					Apr/07/2017
#
# ---------------------------------------------------------------
mysql = require('mysql')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

id_in = process.argv[2]
population_in = process.argv[3]

console.log (id_in + "\t" + population_in)

connection = mysql.createConnection ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger123'
	})

connection.query ('Use city')

today = text_manipulate.get_current_date_proc()
command = "update cities set population = " + population_in
command += " , date_mod = '" + today + "'"
command += " where id = '" + id_in + "'"
console.log command

connection.query(command, (err, rows) ->
#  	if (err) throw err
	console.log "*** 終了 ***"
	)

connection.end()

console.log ("*** ppp ***")
# ---------------------------------------------------------------
