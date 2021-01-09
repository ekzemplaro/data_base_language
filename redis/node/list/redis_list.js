#! /usr/bin/node
// ---------------------------------------------------------------
//	redis_list.js
//
//					Dec/30/2020
//
// ---------------------------------------------------------------
'use strict'

const util = require('util')
const redis = require('redis')

process.on('unhandledRejection', console.dir)



// ---------------------------------------------------------------
async function main()
{
	
	const redisUrl = 'redis://127.0.0.1:6379'
	const client = redis.createClient(redisUrl)

	client.getAsync = util.promisify(client.get)
	client.keysAsync = util.promisify(client.keys)
	client.quitAsync = util.promisify(client.quit)


	const keys = await client.keysAsync('*')
	console.log (keys)
	console.log("keys.length = " + keys.length)
	console.log ("keys[0] = " + keys[0])

    client.quit()
}

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
main()
console.error ("*** 終了 ***")

// ---------------------------------------------------------------
