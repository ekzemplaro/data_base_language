#! /usr/bin/coffee
# ---------------------------------------------------------------
#	sqlite3_create.coffee
#
#					Oct/23/2014
#
# ---------------------------------------------------------------
sqlite3 = require 'sqlite3'
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0711','郡山',62714,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0712','会津若松',23157,'1954-3-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0713','白河',65741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0714','福島',31764,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0715','いわき',49871,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0716','喜多方',65292,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0717','二本松',39251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0718','相馬',52786,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0719','須賀川',96157,'1954-10-2')

	return	dict_aa
# ---------------------------------------------------------------
table_create_insert_proc = (db,dict_aa) ->
	console.log "*** drop_create_table_proc *** start ***"
	command_drop = "drop table if exists cities"
	command_create = "create table cities (id varchar(10), name varchar(20),"
	command_create += " population int, date_mod date)"
	db.serialize () ->
		db.run (command_drop)
		db.run (command_create)
		for key,value  of  dict_aa
			command = sql_insert_gen_proc(key,value)
			db.run (command)
# ---------------------------------------------------------------
sql_insert_gen_proc = (key,value) ->
	command = "insert into cities (id,name,population,date_mod) values ("
	command += "'" + key + "',"
	command += "'" + value.name + "',"
	command += "'" + value.population + "',"
	command += "'" + value.date_mod + "')"
	return	command
# ---------------------------------------------------------------
create_table_proc = (dict_aa) ->
console.log "*** 開始 ***"
file_sqlite3 = process.argv[2]

console.log (file_sqlite3)

dict_aa = data_prepare_proc()

db = new sqlite3.Database (file_sqlite3)

#
#
table_create_insert_proc(db,dict_aa)

db.close
console.log "*** 終了 ***"
# ---------------------------------------------------------------
