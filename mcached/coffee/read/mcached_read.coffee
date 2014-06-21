#! /usr/bin/coffee
# -------------------------------------------------------------
#	mcached_read.coffee
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
	keys = ['t1731','t1732','t1733',
		't1734','t1735','t1736',
		't1737','t1738','t1739'];

	for it of keys
		proc01 (keys[it]);

	client.close();
	console.log("*** 終了 ***");


# -------------------------------------------------------------
client = new memcache.Client(11211,'localhost');
client.connect();
client.addHandler(onConnect);

# -------------------------------------------------------------

