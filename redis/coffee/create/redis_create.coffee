#! /usr/bin/coffee
# ---------------------------------------------------------------
#	redis_create.coffee
#
#					Jul/09/2015
#
# ---------------------------------------------------------------
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1851','福井',61724,'1954-5-18')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1852','敦賀',52938,'1954-4-16')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1853','小浜',28741,'1954-10-7')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1854','大野',39764,'1954-6-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1855','勝山',43872,'1954-8-19')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1856','鯖江',61793,'1954-9-23')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1857','あわら',34851,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1858','越前',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1859','坂井',76157,'1954-10-2')

	return dict_aa

# ---------------------------------------------------------------
console.log "*** 開始 ***"
#
redis = require("redis")
client = redis.createClient(6379,'host_dbase')


dict_aa = data_prepare_proc()

for key,value of dict_aa
	str_json = JSON.stringify(value)
	console.log(str_json)
	client.set(key,str_json,redis.print)
#
client.quit()
console.log "*** 終了 ***"

# ---------------------------------------------------------------
