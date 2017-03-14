#! /usr/bin/node
// ---------------------------------------------------------------
//
//	pouch_read.js
//
//						Mar/15/2017
//
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const file_pouchdb = process.argv[2]

var PouchDB = require ('pouchdb');

var db = new PouchDB (file_pouchdb);

db.allDocs({include_docs: true, ascending: true}, function(err, doc)
{
	for (var it in doc.rows)
		{
		const unit_aa = doc.rows[it]
		var str_out =  unit_aa.key + "\t" + unit_aa.doc.name + "\t"
		str_out += unit_aa.doc.population
		str_out += "\t" + unit_aa.doc.date_mod
		console.log (str_out)
		}
})

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
