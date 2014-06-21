#! /usr/bin/coffee
# -------------------------------------------------------------
#	mcachedb_delete.coffee
#
#					Aug/09/2013
# -------------------------------------------------------------
memcache = require('memcache');

# -------------------------------------------------------------
onConnect = () ->
	console.log("*** 開始 ***")

	client.delete(key_in,(error, result) ->{ })

	client.close()

	console.log("*** 終了 ***")

# -------------------------------------------------------------
key_in=process.argv[2]

console.log(key_in)

client = new memcache.Client(21201,'localhost')
client.connect()
client.addHandler(onConnect)

# -------------------------------------------------------------

