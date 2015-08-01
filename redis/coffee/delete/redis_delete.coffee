#! /usr/bin/coffee
# ---------------------------------------------------------------
#	redis_delete.coffee
#
#					Aug/09/2013
#
# ---------------------------------------------------------------
console.log ("*** 開始 ***")
key_in=process.argv[2]

console.log (key_in)

#
redis = require("redis")
client = redis.createClient(6379,'host_dbase')

client.del(key_in)


client.quit()
console.log "*** 終了 ***"

# ---------------------------------------------------------------
