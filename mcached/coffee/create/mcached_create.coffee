#! /usr/bin/coffee
# -------------------------------------------------------------
#	mcached_create.coffee
#
#					Aug/09/2013
# -------------------------------------------------------------
memcache = require('memcache');

text_manipulate=require ("/var/www/data_base/common/coffee_common/text_manipulate");

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1731','金沢',78436,'1954-3-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1732','輪島',15736,'1954-8-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1733','小松',24189,'1954-5-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1734','七尾',86425,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1735','珠洲',49358,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1736','加賀',65192,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1737','羽咋',37251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1738','かほく',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1739','白山',57391,'1954-10-2')
	
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
client = new memcache.Client(11211,'localhost');
client.connect();
client.addHandler(onConnect);

# ---------------------------------------------------------------
