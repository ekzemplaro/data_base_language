#! /usr/bin/coffee
# ---------------------------------------------------------------
#	postgre_delete.coffee
#
#					Aug/09/2013
#
# ---------------------------------------------------------------
pg = require('pg')
sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')

# ---------------------------------------------------------------
console.log "*** 開始 ***"
id_in = process.argv[2]

console.log (id_in)

str_connect = "tcp://scott:tiger@localhost:5432/city"

pg.connect str_connect, (error,client) ->
	command = sql_manipulate.delete_command_gen (id_in)

	console.log (command)

	query = client.query(command)

	query.on 'end',() ->
		client.end()

	console.log ("*** 終了 ***")
# ---------------------------------------------------------------
