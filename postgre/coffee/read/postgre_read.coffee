#! /usr/bin/coffee
# ---------------------------------------------------------------
#	postgre_read.coffee
#
#					May/21/2014
#
# ---------------------------------------------------------------
console.log "*** 開始 ***"

pg = require('pg')

str_connect = "tcp://scott:tiger@localhost:5432/city"

pg.connect str_connect, (error,client) ->
	query = client.query("select * from cities");

	query.on 'row', (row) ->
		str_out = row.id + '\t'
		str_out += row.name + '\t'
		str_out += row.population + '\t'
		str_out += row.date_mod
		console.log str_out

	query.on 'end',() ->
		client.end()
		console.log "*** 終了 ***"


# ---------------------------------------------------------------
