#! /usr/bin/node
// ---------------------------------------------------------------
//
//	pouch_delete.js
//
//						Mar/14/2017
//
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const file_pouchdb = process.argv[2]
const key_in = process.argv[3]

console.log (key_in)

var PouchDB = require ('pouchdb');

var db = new PouchDB (file_pouchdb);

/*
db.info().then(function (info) {
  console.log(info);
})
*/


db.get(key_in).then (function (doc)
	{
	return db.remove(doc)
	})


console.error ("*** 終了 ***")

// ---------------------------------------------------------------
