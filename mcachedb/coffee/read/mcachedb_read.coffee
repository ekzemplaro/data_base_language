#! /usr/bin/coffee
# -------------------------------------------------------------
#	mcachedb_read.coffee
#
#					Feb/02/2015
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
	keys = ['t1521','t1522','t1523',
		't1524','t1525','t1526',
		't1527','t1528','t1529',
		't1530','t1531','t1532'];

	for it of keys
		proc01 (keys[it]);

	client.close();
	console.log("*** 終了 ***");


# -------------------------------------------------------------
hostname = 'host_ubuntu1'
client = new memcache.Client(21201,hostname);
client.connect();
client.addHandler(onConnect);

# -------------------------------------------------------------

