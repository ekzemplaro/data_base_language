#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	mcached_create.js
//
//					Feb/11/2016
//
// ---------------------------------------------------------------
var memcache = require("memcache")
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1731','金沢',59784,'1950-5-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1732','輪島',48157,'1950-4-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1733','小松',93241,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1734','七尾',31864,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1735','珠洲',42358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1736','加賀',65192,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1737','羽咋',37251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1738','かほく',52486,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1739','白山',57391,'1950-10-2')
	
	return	dict_aa
}

// ---------------------------------------------------------------
function set_proc (client,key,value)
{
//	client.set(key, value,function(error, result){ }, 3600)
	client.set (key,value,function(error, result){ })
}

// ---------------------------------------------------------------
var onConnect = function()
{
	console.log ("*** 開始 ***")

	var dict_aa = data_prepare_proc ()

	for (var key in dict_aa)
		{
		var unit_aa = dict_aa[key]
		var str_unit = JSON.stringify (unit_aa)
		console.log (str_unit)
		set_proc (client,key,str_unit)
		}

	client.close()

	console.log ("*** 終了 ***")
}

// ---------------------------------------------------------------
var client = new memcache.Client (11211,'localhost')
client.connect()
client.addHandler(onConnect)

// ---------------------------------------------------------------
