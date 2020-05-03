// ---------------------------------------------------------------
//	postgre_create.ts
//
//					May/03/2020
//
// ---------------------------------------------------------------
var pg = require('pg')
var text_manipulate= require ('/var/www/data_base/common/typescript_common/text_manipulate')

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3461','広島',19425,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3462','福山',32197,'1950-3-17')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3463','東広島',75241,'1950-6-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3464','呉',37164,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3465','尾道',67358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3466','竹原',69281,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3467','三次',34256,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3468','大竹',52381,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3469','府中',84736,'1950-10-2')
	

	return	dict_aa
}

// ---------------------------------------------------------------
function data_insert_proc(dict_aa,client)
{
	const length:number = Object.keys(dict_aa).length
	console.error ("length = " + length)

	var count:number = 0

	for (var key  in dict_aa)
		{
		var sql_str:string
		= "insert into cities (id,name,population,date_mod) values ("

		const str_data:string = "'" + key + "','" + dict_aa[key].name + "',"
		+ dict_aa[key].population + ",'" + dict_aa[key].date_mod + "')"

		sql_str += str_data

		const query = { text: sql_str,}

		client.query(query)
			.then(res => {
			count += 1
			if (count == length)
				{
		client.end()
		console.error ("*** 終了 ***")
				}
			})
			.catch(e => console.error(e.stack))
		}
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const dict_aa = data_prepare_proc ()

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
	text: 'drop table cities',
}


client.query(query)
	.then(res => {
	console.error ("*** table is dropped ***")
	var command = 'create table cities (id varchar(10), name varchar(20),'
	command += ' population int, date_mod date)'
	const query_b = {text: command,}

	client.query(query_b)
	    .then(res => {
	console.error ("*** table is created ***")
		data_insert_proc(dict_aa,client)
		})
		.catch(e => console.error(e.stack))
	})
	.catch(e => console.error(e.stack))

// ---------------------------------------------------------------
