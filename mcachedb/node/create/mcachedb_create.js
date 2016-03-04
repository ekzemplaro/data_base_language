#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	mcached_create.js
//
//					Feb/15/2016
//
// ---------------------------------------------------------------
var memcache = require("memcache")
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
		var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1521','新潟',69784,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1522','長岡',82157,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1523','新発田',75241,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1524','上越',31864,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1525','糸魚川',42358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1526','加茂',65192,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1527','三条',37251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1528','佐渡',52486,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1529','柏崎',57391,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1530','村上',39186,'1950-5-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1531','十日町',18642,'1950-8-9')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1532','五泉',61975,'1950-10-18')
	
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

	dict_aa = data_prepare_proc ()

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
var hostname = 'host_ubuntu'

var client = new memcache.Client (21201,hostname)
client.connect()
client.addHandler(onConnect)

// ---------------------------------------------------------------
