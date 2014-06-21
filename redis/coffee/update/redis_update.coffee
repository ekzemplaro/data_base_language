#! /usr/bin/coffee
# ---------------------------------------------------------------
#	redis_update.coffee
#
#					Aug/09/2013
#
# ---------------------------------------------------------------
json_manipulate=require ("/var/www/data_base/common/coffee_common/json_manipulate")
# ---------------------------------------------------------------
update_proc = (client,id_in,population_in) ->
	client.get id_in, (err, reply) ->
		if err
			console.log("Get error: " + err)
		else if (reply != null)
			json_out = json_manipulate.json_update_proc(reply,population_in)

			console.log (json_out)

			client.set(id_in,json_out, redis.print)
			client.quit()

# ---------------------------------------------------------------
console.log "*** 開始 ***"
id_in=process.argv[2]
population_in=process.argv[3]

console.log (id_in + "\t" + population_in)

#
redis = require("redis")
client = redis.createClient(6379,'host_dbase')


update_proc(client,id_in,population_in)

console.log "*** 終了 ***"

# ---------------------------------------------------------------
