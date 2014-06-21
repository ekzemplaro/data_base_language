#! /usr/bin/coffee
# ---------------------------------------------------------------
#	redis_create.coffee
#
#					Jun/05/2014
#
# ---------------------------------------------------------------
console.log "*** 開始 ***"
#
redis = require("redis")
client = redis.createClient(6379,'host_dbase')


client.set('t1851', '{"name":"福井","population":41537,"date_mod":"1954-3-14"}', redis.print)
client.set('t1852', '{"name":"敦賀","population":72915,"date_mod":"1954-5-17"}', redis.print)
client.set('t1853', '{"name":"小浜","population":15753,"date_mod":"1954-8-9"}', redis.print)
client.set('t1854', '{"name":"大野","population":28346,"date_mod":"1954-10-12"}', redis.print)
client.set('t1855', '{"name":"勝山","population":62158,"date_mod":"1954-11-15"}' , redis.print)
client.set('t1856', '{"name":"鯖江","population":42975,"date_mod":"1954-5-12"}'
 , redis.print)
client.set('t1857', '{"name":"あわら","population":51826,"date_mod":"1954-2-14"}'
, redis.print)
client.set('t1858', '{"name":"越前","population":37254,"date_mod":"1954-1-19"}', redis.print)
client.set('t1859', '{"name":"坂井","population":62457,"date_mod":"1954-7-11"}'
, redis.print)


keys=["t1851","t1852","t1853"]
for key in keys
	client.get(key, redis.print)

client.quit()
console.log "*** 終了 ***"

# ---------------------------------------------------------------
