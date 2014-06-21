#! /usr/bin/coffee
# -------------------------------------------------------------
#	mcachedb_create.coffee
#
#					Aug/09/2013
# -------------------------------------------------------------
memcache = require('memcache');

text_manipulate=require ("/var/www/data_base/common/coffee_common/text_manipulate");

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1521','新潟',78451,'1954-2-24')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1522','長岡',15726,'1954-1-5')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1523','新発田',24193,'1954-11-20')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1524','上越',31864,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1525','糸魚川',42358,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1526','加茂',65192,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1527','三条',37251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1528','佐渡',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1529','柏崎',57391,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1530','村上',39186,'1954-5-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1531','十日町',18642,'1954-8-9')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1532','五泉',97532,'1954-10-18')
	
	return	dict_aa

# ---------------------------------------------------------------
set_proc = (client,key,value) ->
	client.set(key,value,(error, result)->{ })

# ---------------------------------------------------------------
onConnect = () ->
	console.log("*** 開始 ***")

	dict_aa = data_prepare_proc()

	for key,value of dict_aa
		str_unit = JSON.stringify(value)
		console.log(str_unit)
		set_proc(client,key,str_unit)

	client.close()

	console.log("*** 終了 ***")

# ---------------------------------------------------------------
client = new memcache.Client(21201,'localhost');
client.connect();
client.addHandler(onConnect);

# ---------------------------------------------------------------
