#! /usr/bin/coffee
# ---------------------------------------------------------------
#	webdav_create.coffee
#
#					Dec/23/2013
#
# ---------------------------------------------------------------
http = require('http')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate')
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1351','八王子',65714,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1352','立川',26157,'1954-3-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1353','武蔵野',68741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1354','三鷹',38729,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1355','青梅',49352,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1356','府中',67285,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1357','昭島',36251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1358','調布',54623,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1359','町田',21847,'1954-10-2')

	return	dict_aa

# ---------------------------------------------------------------
console.log "*** 開始 ***"
#

dict_aa = data_prepare_proc()
json_str = JSON.stringify(dict_aa)

http_manipulate.put_proc('host_dbase',3004,'/city/tokyo.json',json_str)

console.log "*** 終了 ***"
# ---------------------------------------------------------------
