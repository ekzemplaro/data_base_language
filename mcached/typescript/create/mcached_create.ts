// ---------------------------------------------------------------
//	mcached_create.ts
//
//					Feb/11/2016
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

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1731','金沢',51784,'2012-4-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1732','輪島',48657,'2012-8-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1733','小松',93741,'2012-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1734','七尾',31264,'2012-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1735','珠洲',42358,'2012-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1736','加賀',65192,'2012-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1737','羽咋',37251,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1738','かほく',52486,'2012-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1739','白山',57391,'2012-10-2')
	
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
		var str_unit: string = JSON.stringify (unit_aa)
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
