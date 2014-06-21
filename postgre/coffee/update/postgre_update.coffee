#! /usr/bin/coffee
# ---------------------------------------------------------------
#	postgre_update.coffee
#
#					Aug/09/2013
#
# ---------------------------------------------------------------
pg = require('pg')
sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')

# ---------------------------------------------------------------
console.log ("*** 開始 ***")
id_in = process.argv[2]
population_in = process.argv[3]

console.log (id_in + "\t" + population_in)

str_connect = "tcp://scott:tiger@localhost:5432/city"

pg.connect str_connect,(error,client) ->
	command = sql_manipulate.update_command_gen(id_in,population_in)

	console.log (command)

	query = client.query(command)

	query.on 'end',() ->
		client.end()

	console.log ("*** 終了 ***")

# ---------------------------------------------------------------
