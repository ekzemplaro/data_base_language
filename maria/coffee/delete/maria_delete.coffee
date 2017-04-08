#! /usr/bin/coffee
# ---------------------------------------------------------------
#	maria_delete.coffee
#
#					Apr/07/2017
#
# ---------------------------------------------------------------
mysql = require('mysql')
sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')

# ---------------------------------------------------------------
console.log "*** 開始 ***"

id_in = process.argv[2]

console.log (id_in)

connection = mysql.createConnection ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger123'
	})

connection.query ('Use city')

command = sql_manipulate.delete_command_gen (id_in)

connection.query(command, (err,rows) ->
#  	if err
#		console.log("Get error: " + err)
#		throw err
	console.log "*** 終了 ***"
	)

connection.end()

console.log ("*** ppp ***")
# ---------------------------------------------------------------
