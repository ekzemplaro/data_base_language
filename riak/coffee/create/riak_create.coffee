#! /usr/bin/coffee
# ---------------------------------------------------------------
#	riak_create.coffee
#
#					Dec/24/2013
#
# ---------------------------------------------------------------
http = require('http')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate')
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3251','松江',85214,'1954-5-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3252','出雲',53427,'1954-4-11')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3253','大田',48271,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3254','雲南',69314,'1954-2-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3255','江津',56138,'1954-7-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3256','浜田',79432,'1954-8-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3257','益田',25971,'1954-1-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3258','安来',48176,'1954-9-26')

	return	dict_aa


# ---------------------------------------------------------------
console.log "*** 開始 ***"
#
dict_aa = data_prepare_proc()
console.log "*** bbb ***"

for key,value of dict_aa
	json_str = JSON.stringify(value)

	http_manipulate.put_proc('localhost',8098,'/riak/shimane/' + key,json_str)

console.log "*** 終了 ***"

# ---------------------------------------------------------------
