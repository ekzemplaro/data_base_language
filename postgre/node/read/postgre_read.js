#! /usr/bin/node
// ---------------------------------------------------------------
//	postgre_read.js
//
//					Sep/12/2018
//
// ---------------------------------------------------------------
console.error ("*** 開始 ***");

const { Client } = require('pg')

const client = new Client({
	user: 'scott',
	host: 'localhost',
	database: 'city',
	password: 'tiger123',
	port: 5432,
})

client.connect()

const query = {
	text: 'SELECT * FROM cities',
}

client.query(query)
    .then(res => {
	for (var it in res.rows)
		{
		row = res.rows[it]
		var str_out = row.id + '\t'
		str_out += row.name + '\t'
		str_out += row.population + '\t'
		str_out += row.date_mod
		console.log (str_out)
		}
	client.end()
	console.error ("*** 終了 ***")
	})
	.catch(e => console.error(e.stack))

// ---------------------------------------------------------------
