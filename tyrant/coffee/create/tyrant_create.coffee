#! /usr/bin/coffee
# -------------------------------------------------------------
#	tyrant_create.coffee
#
#					Aug/09/2013
# -------------------------------------------------------------
memcache = require('memcache');

text_manipulate=require ("/var/www/data_base/common/coffee_common/text_manipulate");

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4761','那覇',84365,'1954-2-8')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4762','宜野湾',57284,'1954-5-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4763','石垣',24137,'1954-11-20')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4764','浦添',31864,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4765','名護',49318,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4766','糸満',65792,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4767','沖縄',37251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4768','豊見城',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4769','うるま',57391,'1954-10-2')
	
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
client = new memcache.Client(1978,'ubuntu_1504');
client.connect();
client.addHandler(onConnect);

# ---------------------------------------------------------------
