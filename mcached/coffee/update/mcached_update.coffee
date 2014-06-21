#! /usr/bin/coffee
# -------------------------------------------------------------
#	mcached_update.coffee
#
#					Aug/09/2013
# -------------------------------------------------------------
memcache = require('memcache');

text_manipulate=require ("/var/www/data_base/common/coffee_common/text_manipulate");
json_manipulate=require ("/var/www/data_base/common/coffee_common/json_manipulate")

# -------------------------------------------------------------
set_proc = (client,key,value) ->
#	client.set(key, value,function(error, result){ }, 3600)
	console.log("*** set_proc *** " + value)
	client.set(key,value,(error,result) ->{ })


# -------------------------------------------------------------
update_proc = (client,key,population) ->
	client.get(key,(error,reply) ->
		if (!error)
			if (reply != null)
				json_out = json_manipulate.json_update_proc(reply,population)
				console.log("*** new *** " + json_out)
				set_proc(client,key,json_out)
		client.close()
		console.log("*** 終了 ***")
		)

# -------------------------------------------------------------
onConnect = () ->
	console.log("*** 開始 ***")

	update_proc(client,key_in,population_in)


# -------------------------------------------------------------
key_in=process.argv[2]
population_in=process.argv[3]

console.log (key_in + "\t" + population_in)

client = new memcache.Client(11211,'localhost')
client.connect()
client.addHandler(onConnect)

# -------------------------------------------------------------

