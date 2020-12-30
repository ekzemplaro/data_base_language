#! /usr/bin/node
// ---------------------------------------------------------------
//	redis_create.js
//
//					Dec/30/2020
//
// ---------------------------------------------------------------
'use strict'

const util = require('util')
const redis = require('redis')

process.on('unhandledRejection', console.dir)

var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")
// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1851','福井',95714,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1852','敦賀',28157,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1853','小浜',67241,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1854','大野',32164,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1855','勝山',41358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1856','鯖江',64792,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1857','あわら',38251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1858','越前',52486,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t1859','坂井',25397,'1950-11-9')
	
	return	dict_aa
}

// ---------------------------------------------------------------
async function main(options)
{
	var dict_aa = data_prepare_proc ()

	const redisUrl = 'redis://127.0.0.1:6379'
	const client = redis.createClient(redisUrl)

	client.setAsync = util.promisify(client.set)
	client.quitAsync = util.promisify(client.quit)

	const keys = Object.keys(dict_aa)

	keys.forEach(async function(key,index)
		{
		const str_json = JSON.stringify (dict_aa[key])

		await client.setAsync(key, str_json)

		})

	await client.quitAsync()
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

main({ argv: process.argv })

console.error ("*** 終了 ***")
// ---------------------------------------------------------------
