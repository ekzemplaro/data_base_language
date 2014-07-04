#! /usr/bin/coffee
# ---------------------------------------------------------------
#	mysql_create.coffee
#
#					Jul/03/2014
#
# ---------------------------------------------------------------
mysql = require('mysql')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3321','岡山',28163,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3322','倉敷',57296,'1954-3-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3323','津山',24187,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3324','玉野',64392,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3325','笠岡',58731,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3326','井原',54796,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3327','総社',38257,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3328','高梁',12486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3329','新見',26759,'1954-10-2')
	

	return	dict_aa
# ---------------------------------------------------------------
#
console.log "*** 開始 ***"

dict_aa = data_prepare_proc()
text_manipulate.dict_display_proc(dict_aa)

connection = mysql.createClient ({
	host: 'host_dbase',
	user: 'scott',
	password: 'tiger'
	})

connection.query ('Use city')

connection.query ('drop table if exists cities')

command = 'create table cities (id varchar(10), name varchar(20),'
command += ' population int, date_mod date)'
connection.query (command)

for key,value of dict_aa
	sql_str  = "insert into cities (id,name,population,date_mod) values ("

	str_data = "'" + key + "','" + dict_aa[key].name + "'," \
		+ dict_aa[key].population + ",'" + dict_aa[key].date_mod + "')"

	sql_str += str_data
	connection.query (sql_str)
connection.end()

console.log "*** 終了 ***"
#  ---------------------------------------------------------------
