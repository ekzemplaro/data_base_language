#! /usr/bin/coffee
# ---------------------------------------------------------------
#	mssql_read.coffee
#
#					Nov/19/2015
#
# ---------------------------------------------------------------
mssql = require('mssql') 

console.log "*** 開始 ***"

config = {
	user: 'sa',
	password: 'Tiger123',
	server: 'host_mssql\EG',
	database: 'city',
}

connection = new mssql.Connection(config, (err) ->
	request = new mssql.Request(connection)

	str_sql = "select * from cities"

	request.query(str_sql, (err, rows) ->
		for row in rows
			str_out = row.id + "\t"
			str_out += row.name + "\t"
			str_out += row.population + "\t"
			str_out += row.date_mod
			console.log (str_out)

		console.log "*** 終了 ***"
		)

	connection.close()

)

# ---------------------------------------------------------------
