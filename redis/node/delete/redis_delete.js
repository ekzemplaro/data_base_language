#! /usr/bin/node
// ---------------------------------------------------------------
//	redis_delete.js
//
//					Dec/30/2020
//
// ---------------------------------------------------------------
'use strict'

const util = require('util')
const redis = require('redis')

process.on('unhandledRejection', console.dir)
// ---------------------------------------------------------------
async function main (options)
{
	var argv = options.argv
	const key_in=argv[2]
	console.log (key_in)

	const redisUrl = 'redis://127.0.0.1:6379'
	const client = redis.createClient(redisUrl)

	client.delAsync = util.promisify(client.del)
	client.quitAsync = util.promisify(client.quit)

	await client.delAsync(key_in)

	await client.quitAsync()
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

main({ argv: process.argv })

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
