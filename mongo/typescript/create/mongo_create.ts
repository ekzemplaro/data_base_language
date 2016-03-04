//
//	mongo_create.ts
//
//					Feb/18/2016
//
// ----------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")
// ----------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1161','さいたま',37154,'2012-7-23')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1162','所沢',24657,'2012-5-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1163','越谷',95421,'2012-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1164','久喜',32864,'2012-6-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1165','熊谷',47358,'2012-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1166','秩父',65792,'2012-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1167','川越',37251,'2012-3-25')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1168','和光',52386,'2012-7-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1169','新座',21893,'2012-2-14')
	
	return	dict_aa
}

// ----------------------------------------------------------------
function loop_insert_proc (dict_aa,collection)
{
	for (var key in dict_aa)
		{
		var name = dict_aa[key].name
		var population = dict_aa[key].population
		var date_mod = dict_aa[key].date_mod
		var document = {'key': key, 'name': name,
			 'population': population,'date_mod': date_mod}
		collection.insert(document, {w:0})
		}
}

// ----------------------------------------------------------------
var MongoClient = require('mongodb').MongoClient

console.log ("*** 開始 ***")

var dict_aa = data_prepare_proc ()

var host = 'localhost'
var port = 27017

var db_name = 'city_db'

var str_connect = "mongodb://" + host + ":" + port + "/" + db_name + "?w=1" 
console.log("Connecting to " + host + ":" + port)

MongoClient.connect (str_connect, function(err, db)
	{
	db.dropDatabase(function(err, result)
		{
		var collection = db.collection('saitama')

		collection.remove ({},function (err, result)
			{
			loop_insert_proc (dict_aa,collection)

			db.close()
			console.log ("*** 終了 ***")
			})
		})
	})

// ----------------------------------------------------------------
