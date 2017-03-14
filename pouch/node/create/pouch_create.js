#! /usr/bin/node
// ---------------------------------------------------------------
//
//	pouch_create.js
//
//						Mar/14/2017
//
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const file_pouchdb = process.argv[2]

var PouchDB = require('pouchdb')

var db = new PouchDB (file_pouchdb)

/*
db.info().then(function (info) {
  console.log(info);
})
*/

var dict_aa = data_prepare_proc ()

for (var key in dict_aa)
	{
	const unit_aa = dict_aa[key]
	var doc = {"_id": key, "name": unit_aa['name'],
		"population": unit_aa['population'],
		 "date_mod": unit_aa['date_mod']}
	db.put (doc)
	}


/*
db.close().then(function () {
	console.log ("End")
})

*/

console.error ("*** 終了 ***")

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
