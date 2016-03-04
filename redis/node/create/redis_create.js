#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	redis_create.js
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")
// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1851','福井',95714,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1852','敦賀',28157,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1853','小浜',67241,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1854','大野',32864,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1855','勝山',41358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1856','鯖江',64792,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1857','あわら',38251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1858','越前',52486,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1859','坂井',26157,'1950-11-18')
	
	return	dict_aa
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
//
var dict_aa = data_prepare_proc ()

var redis = require ("redis")
var client = redis.createClient (6379,'host_dbase')

client.on("error", function (err) {
        console.log("Redis connection error to " + client.host + ":" + client.port + " - " + err)
    })

for (var key in dict_aa)
	{
	var str_json = JSON.stringify (dict_aa[key])

	client.set(key, str_json, redis.print)
	}

client.quit()
console.log ("*** 終了 ***")

// ---------------------------------------------------------------
