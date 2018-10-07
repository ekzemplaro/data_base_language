#! /usr/bin/node
// ---------------------------------------------------------------
//	elastic_create.js
//
//					Oct/06/2018
//
// ---------------------------------------------------------------
const text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const dict_aa = data_prepare_proc ()

var Client = require('node-rest-client').Client
var client = new Client()

const url_base = "http://localhost:9200/cities/tochigi"

for (var key in dict_aa)
	{
	const unit_aa = dict_aa[key]
	const json_str = JSON.stringify(unit_aa)
	const url = url_base + "/" + key
	console.log(url)
	const headers = {'content-type': 'application/json'}
	const args = { data: json_str, headers: headers }
	client.put(url,args,function (data, response) {
		})
	}

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0921','宇都宮',63724,'1950-3-24')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0922','小山',28157,'1950-9-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0923','佐野',64781,'1950-11-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0924','足利',38124,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0925','日光',49675,'1950-8-28')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0926','下野',65813,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0927','さくら',37251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0928','矢板',52416,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0929','真岡',26857,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0930','栃木',48923,'1950-12-20')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0931','大田原',75284,'1950-2-7')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0932','鹿沼',92351,'1950-5-17')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0933','那須塩原',81937,'1950-6-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t0934','那須烏山',72158,'1950-8-14')

	return	dict_aa
}

// ---------------------------------------------------------------

