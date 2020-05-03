// ---------------------------------------------------------------
//	postgre_update.ts
//
//					May/03/2020
//
// ---------------------------------------------------------------
var pg = require('pg')
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
const id_in:string = process.argv[2]
const population_in:number = parseInt(process.argv[3])

console.log (id_in + "\t" + population_in)

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

const command:string = sql_manipulate.update_command_gen (id_in,population_in)

console.error (command)

const query = {
	text: command,
}

client.query(query)
    .then(res => {
	client.end()
	console.error ("*** 終了 ***")
	})
	.catch(e => console.error(e.stack))

// ---------------------------------------------------------------
