#! /usr/bin/coffee
# -------------------------------------------------------------
#	mcachedb_delete.coffee
#
#					Feb/02/2015
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

hostname = 'host_ubuntu1'
client = new memcache.Client(21201,hostname)
client.connect()
client.addHandler(onConnect)

# -------------------------------------------------------------

