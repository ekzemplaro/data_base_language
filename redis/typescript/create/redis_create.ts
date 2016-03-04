// ---------------------------------------------------------------
//	redis_create.ts
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")
// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1851','福井',73814,'2012-5-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1852','敦賀',19257,'2012-4-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1853','小浜',25841,'2012-12-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1854','大野',31864,'2012-3-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1855','勝山',46358,'2012-2-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1856','鯖江',63792,'2012-7-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1857','あわら',38251,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1858','越前',52486,'2012-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1859','坂井',26157,'2012-11-18')
	
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
