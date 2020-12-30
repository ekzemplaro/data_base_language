#! /usr/bin/node
// ---------------------------------------------------------------
//	redis_update.js
//
//					Dec/30/2020
//
// ---------------------------------------------------------------
'use strict'

const util = require('util')
const redis = require('redis')

process.on('unhandledRejection', console.dir)

var node_common = '/var/www/data_base/common/node_common'

var text_manipulate=require (node_common + '/text_manipulate')

// ---------------------------------------------------------------
async function main(options)
{
	var argv = options.argv
	const key_in=argv[2]
	const population_in=argv[3]

	console.log (key_in + "\t" + population_in)

	const redisUrl = 'redis://127.0.0.1:6379'
	const client = redis.createClient(redisUrl)

	client.getAsync = util.promisify(client.get)
	client.setAsync = util.promisify(client.set)
	client.quitAsync = util.promisify(client.quit)

	const value = await client.getAsync(key_in)
	console.log(value)

	try
		{
		const unit_aa = JSON.parse(value)
		var out_str = key_in + "\t"
		out_str  += unit_aa.name + "\t"
		out_str += unit_aa.population + "\t"
		out_str += unit_aa.date_mod
		console.log (out_str)

		unit_aa.population = population_in
		unit_aa.date_mod =  text_manipulate.get_current_date_proc ()
		const json_out = JSON.stringify (unit_aa)

		console.log (json_out)
		await client.setAsync (key_in,json_out)
		}
		catch (error)
		{
		console.error ("*** error *** from JSON.parse ***")
		console.error (error)
		console.error (key_in)
		}

	await client.quitAsync()
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

main({ argv: process.argv })

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
