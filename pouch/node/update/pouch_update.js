#! /usr/bin/node
// ---------------------------------------------------------------
//
//	pouch_update.js
//
//						Mar/14/2017
//
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const file_pouchdb = process.argv[2]
const key_in = process.argv[3]
const population_in = process.argv[4]

console.log (key_in + "\t" + population_in)

var PouchDB = require ('pouchdb');

var db = new PouchDB (file_pouchdb);

/*
db.info().then(function (info) {
  console.log(info);
})
*/

date_mod = text_manipulate.get_current_date_proc ()

db.get(key_in).then (function (doc)
	{
	doc.population = population_in
	doc.date_mod = date_mod
	return db.put(doc)
	}).then(function ()
		{
		return db.get(key_in)
		}).then(function (doc)
			{
//	console.log(doc)
		var str_out = doc._id + "\t" + doc.name + "\t" + doc.population
		str_out += "\t" + doc.date_mod
		console.log (str_out)
		})


console.error ("*** 終了 ***")

// ---------------------------------------------------------------
