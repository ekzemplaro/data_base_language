// ---------------------------------------------------------------
//	maria_read.ts
//
//					May/02/2016
//
// ---------------------------------------------------------------
var text_manipulate=require ("/var/www/data_base/common/typescript_common/text_manipulate")

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var mysql = require('mysql')

var connection = mysql.createConnection ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger123'
	})

connection.query ('Use city')

connection.query("select * from cities", function (err, rows)
	{
  	if (err) throw err
  	console.log (rows.length)

	var dict_aa = new Object ()

	for (var it in rows)
		{
		dict_aa[rows[it].id] = {"name": rows[it].name,
			"population": rows[it].population,
			"date_mod": rows[it].date_mod}
		}

	text_manipulate.dict_display_proc (dict_aa)

	console.log ("*** 終了 ***")
	})

connection.end()

// ---------------------------------------------------------------
