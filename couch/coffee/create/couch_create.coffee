#! /usr/bin/coffee
# ---------------------------------------------------------------
#	couch_create.coffee
#
#					Jan/19/2015
#
# ---------------------------------------------------------------
cradle = require ('cradle')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"
#
name = 'nagano'
cc = new (cradle.Connection)

db = cc.database (name)

db.exists (err, exists) ->
	if err
		console.log('error', err)
	else if exists
		db.destroy()
		create_proc (db)
		console.log ("*** db is destroyed ***")
	else
		console.log('database does not exists.')

console.log "*** 終了 ***"
# ---------------------------------------------------------------
# [4]:
create_proc = (db) ->
	dict_aa = data_prepare_proc()
	db.create (err,doc) ->
		for key of dict_aa
			console.log (key)
			db.put key,dict_aa[key], (err,res) ->
				console.log (res)
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2021','長野',43562,'1954-8-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2022','松本',26157,'1954-3-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2023','上田',68395,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2024','小諸',38724,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2025','岡谷',49352,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2026','塩尻',67289,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2027','茅野',36457,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2028','飯田',54623,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2029','中野',21947,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2030','諏訪',48392,'1954-12-20')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2031','駒ヶ根',61875,'1954-2-7')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2032','佐久',29834,'1954-5-17')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2033','伊那',47563,'1954-6-19')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2034','千曲',72368,'1954-8-14')

	return	dict_aa

# ---------------------------------------------------------------
