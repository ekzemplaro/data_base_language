#! /usr/bin/coffee
# -------------------------------------------------------------
#	tyrant_delete.coffee
#
#					Jul/09/2015
# -------------------------------------------------------------
memcache = require('memcache');

# -------------------------------------------------------------
onConnect = () ->

	client.delete(key_in,(error, result) ->{ })

	client.close()

	console.log("*** 終了 ***")

# -------------------------------------------------------------
key_in=process.argv[2]

console.log("*** 開始 ***")
console.log(key_in)

client = new memcache.Client(1978,'ubuntu_1504')
client.connect()
client.addHandler(onConnect)

# -------------------------------------------------------------

