// ---------------------------------------------------------------
//	postgre_read.ts
//
//					May/03/2020
//
// ---------------------------------------------------------------
console.error ("*** 開始 ***");

const { Client } = require('pg')

require('dotenv').config()

const client = new Client({
	user: process.env.user,
	host: 'localhost',
	database: process.env.data_base,
	password: process.env.password,
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
		var row = res.rows[it]

		var str_out:string = row.id + '\t'
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
