#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	couch_create.js
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
var cradle = require ('cradle')
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
//
var db_name = 'nagano'
var cc = new (cradle.Connection)

var db = cc.database (db_name)

db.exists (function (err, res_exists)
	{
	if (err)
		{
		console.log('error', err)
		}
	else
		{
	 	if (res_exists)
			{
			db.destroy ()
			console.log ("*** db is destroyed ***")
			}

		create_proc (db)
		}
	})

	console.log ("*** 終了 ***")
// ---------------------------------------------------------------
// [4]:
function create_proc (db)
{
	db.create (function (err,doc) {

	var dict_aa = data_prepare_proc ()

	for (var key in dict_aa)
		{
		console.log (key)
		db.put (key,dict_aa[key],function (err,res)
			{
//			console.log (err)
			console.log (res)
			})
		}
	})
}

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2021','長野',82136,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2022','松本',71928,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2023','上田',63241,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2024','小諸',38724,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2025','岡谷',49357,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2026','塩尻',67283,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2027','茅野',36251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2028','飯田',54623,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2029','中野',21847,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2030','諏訪',48392,'1950-12-20')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2031','駒ヶ根',51875,'1950-2-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2032','佐久',69234,'1950-5-17')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2033','伊那',31897,'1950-6-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2034','千曲',52718,'1950-8-24')

	return	dict_aa
}	

// ---------------------------------------------------------------
