#! /usr/bin/coffee
# ---------------------------------------------------------------
#	redis_delete.coffee
#
#					Aug/09/2013
#
# ---------------------------------------------------------------
console.log "*** 開始 ***"
id_in=process.argv[2]

console.log (id_in)

#
redis = require("redis")
client = redis.createClient(6379,'host_dbase')


client.del(id_in)

keys=["t1851","t1852","t1853",
	"t1854","t1855","t1856",
	"t1857","t1858","t1859"]

for key in keys
	client.get(key, redis.print)

client.quit()
console.log "*** 終了 ***"

# ---------------------------------------------------------------
