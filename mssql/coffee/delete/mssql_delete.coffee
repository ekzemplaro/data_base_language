#! /usr/bin/coffee
# ---------------------------------------------------------------
#	mssql_delete.coffee
#
#					Jul/03/2014
#
# ---------------------------------------------------------------
mssql = require('mssql') 
sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')
# ---------------------------------------------------------------

console.log "*** 開始 ***"

id_in = process.argv[2]

console.log (id_in)

config = {
	user: 'sa',
	password: 'scott_tiger',
	server: 'host_mssql',
	database: 'city',
}

connection = new mssql.Connection(config, (err) ->
	request = new mssql.Request(connection)

	command = sql_manipulate.delete_command_gen (id_in)

	request.query(command, (err, rows) ->
		if (err)
			throw err

		console.log "*** 終了 ***"
		)

	connection.close()

)

# ---------------------------------------------------------------
