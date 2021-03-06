// ---------------------------------------------------------------
//	couch_create.ts
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var cradle = require ('cradle')
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
//
var db_name: string = 'nagano'
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

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2021','長野',35496,'2012-7-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2022','松本',93728,'2012-2-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2023','上田',74156,'2012-11-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2024','小諸',38124,'2012-5-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2025','岡谷',42357,'2012-9-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2026','塩尻',67283,'2012-8-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2027','茅野',36251,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2028','飯田',54623,'2012-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2029','中野',21847,'2012-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2030','諏訪',48392,'2012-12-20')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2031','駒ヶ根',51875,'2012-2-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2032','佐久',69234,'2012-5-17')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2033','伊那',31897,'2012-6-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2034','千曲',52718,'2012-8-24')

	return	dict_aa
}	

// ---------------------------------------------------------------
