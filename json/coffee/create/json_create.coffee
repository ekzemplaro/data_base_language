#! /usr/bin/coffee
# ---------------------------------------------------------------
#	json_create.coffee
#
#					Sep/06/2016
#
# ---------------------------------------------------------------
fs = require("fs")
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0921','宇都宮',61714,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0922','小山',23157,'1954-3-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0923','佐野',69741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0924','足利',32764,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0925','日光',45871,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0926','下野',67292,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0927','さくら',38251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0928','矢板',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0929','真岡',26957,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0930','栃木',41873,'1954-12-20')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0931','大田原',91345,'1954-2-7')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0932','鹿沼',12854,'1954-5-17')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0933','那須塩原',21867,'1954-6-19')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0934','那須烏山',62758,'1954-8-14')

	return	dict_aa

# ---------------------------------------------------------------
console.error ("*** 開始 ***")

filename=process.argv[2]

dict_aa = data_prepare_proc()

json_str = JSON.stringify dict_aa

fs.writeFile(filename,json_str)

console.error ("*** 終了 ***")

# ---------------------------------------------------------------
