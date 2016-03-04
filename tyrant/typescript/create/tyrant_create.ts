// ---------------------------------------------------------------
//	tyrant_create.ts
//
//					Feb/15/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var memcache = require("memcache")
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4761','那覇',75684,'2012-3-24')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4762','宜野湾',31257,'2012-8-5')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4763','石垣',65241,'2012-7-23')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4764','浦添',31864,'2012-10-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4765','名護',49318,'2012-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4766','糸満',65792,'2012-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4767','沖縄',37251,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4768','豊見城',52486,'2012-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t4769','うるま',57391,'2012-10-2')
	
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
var client = new memcache.Client (1978,'host_ubuntu')
client.connect()
client.addHandler(onConnect)

// ---------------------------------------------------------------
