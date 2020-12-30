#! /usr/bin/node
// ---------------------------------------------------------------
//
//	redis_read.js
//
//					Dec/30/2020
// ---------------------------------------------------------------
'use strict'

const util = require('util')
const redis = require('redis')

process.on('unhandledRejection', console.dir)

// ---------------------------------------------------------------
async function main (options)
{
	const redisUrl = 'redis://127.0.0.1:6379'
	const client = redis.createClient(redisUrl)

	client.getAsync = util.promisify(client.get)
	client.keysAsync = util.promisify(client.keys)
	client.quitAsync = util.promisify(client.quit)

	const keys = await client.keysAsync('*')

	keys.forEach(async function(key,index)
		{
		const value = await client.getAsync(key)

		try
		{
		const data = JSON.parse(value)
		var out_str = key + "\t"
		out_str  += data.name + "\t"
		out_str += data.population + "\t"
		out_str += data.date_mod
		console.log (out_str)
		}
		catch (error)
		{
		console.error ("*** error *** from JSON.parse ***")
		console.error (error)
		console.error (key)
		}
		})

	await client.quitAsync()
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
main({ argv: process.argv })
console.error ("*** 終了 ***")

// ---------------------------------------------------------------
