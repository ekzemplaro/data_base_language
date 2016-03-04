// ---------------------------------------------------------------
//	riak_create.ts
//
//					Feb/25/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate')
// ---------------------------------------------------------------
var http = require('http')

console.log ("*** 開始 ***")
//
var dict_aa = data_prepare_proc ()


for (var key in dict_aa)
	{
	var json_str: string = JSON.stringify (dict_aa[key])

	http_manipulate.put_proc
		('host_ubuntu',8098,'/riak/shimane/' + key,json_str)
	}

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3251','松江',35714,'2012-4-13')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3252','出雲',19327,'2012-9-16')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3253','大田',62871,'2012-12-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3254','雲南',87134,'2012-9-4')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3255','江津',45618,'2012-2-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3256','浜田',65492,'2012-1-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3257','益田',38251,'2012-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3258','安来',52786,'2012-7-26')

	return	dict_aa
}	

// ---------------------------------------------------------------
