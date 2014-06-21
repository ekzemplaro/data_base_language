#! /usr/bin/coffee
# ---------------------------------------------------------------
#	redis_read.coffee
#
#					Aug/09/2013
#
# ---------------------------------------------------------------
json_manipulate=require ("/var/www/data_base/common/coffee_common/json_manipulate")
# ---------------------------------------------------------------
read_single_proc = (client,id) ->
	client.get id, (err, reply) ->
		if err
			console.log("Get error: " + err)
		else if (reply != null)
			json_str = reply
			json_manipulate.json_display_proc(id, reply) 

# ---------------------------------------------------------------
console.log "*** 開始 ***"
#
redis = require("redis")
client = redis.createClient(6379,'host_dbase')

keys=["t1851","t1852","t1853",
	"t1854","t1855","t1856",
	"t1857","t1858","t1859"]

for key in keys
	read_single_proc(client,key)

client.quit()
console.log "*** 終了 ***"

# ---------------------------------------------------------------
