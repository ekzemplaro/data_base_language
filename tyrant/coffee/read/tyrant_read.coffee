#! /usr/bin/coffee
# -------------------------------------------------------------
#	tyrant_read.coffee
#
#					Aug/09/2013
# -------------------------------------------------------------
memcache = require('memcache');

json_manipulate=require ("/var/www/data_base/common/coffee_common/json_manipulate")

# -------------------------------------------------------------
proc01 = (key) ->
	client.get(key, (error,reply) ->
		if (!error)
			if (reply != null)
				json_manipulate.json_display_proc(key,reply)
	)
#
# -------------------------------------------------------------
onConnect = () ->
	console.log("*** 開始 ***");
	keys = ['t4761','t4762','t4763',
		't4764','t4765','t4766',
		't4767','t4768','t4769'];

	for it of keys
		proc01 (keys[it]);

	client.close();
	console.log("*** 終了 ***");


# -------------------------------------------------------------
client = new memcache.Client(1978,'ubuntu_1504');
client.connect();
client.addHandler(onConnect);

# -------------------------------------------------------------

