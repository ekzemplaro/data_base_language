#! /usr/bin/coffee
# ---------------------------------------------------------------
#	postgre_create.coffee
#
#					May/14/2014
#
# ---------------------------------------------------------------
pg = require('pg')
sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3461','広島',61423,'1954-8-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3462','福山',79456,'1954-2-17')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3463','東広島',32741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3464','呉',76429,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3465','尾道',62578,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3466','竹原',29481,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3467','三次',31254,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3468','大竹',56481,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t3469','府中',81736,'1954-10-2')
	
	return	dict_aa
# ---------------------------------------------------------------
console.log ("*** 開始 ***")

dict_aa = data_prepare_proc()

str_connect = "tcp://scott:tiger@localhost:5432/city"

pg.connect str_connect,(error,client) ->
	client.query ('drop table cities')
	command = 'create table cities (id varchar(10), name varchar(20),'
	command += ' population int, date_mod date)'
	query = client.query (command)

	for key,value of dict_aa
		sql_str  = "insert into cities (id,name,population,date_mod) values ("

		str_data = "'" + key + "','" + value.name + "',"
		str_data += value.population + ",'" + value.date_mod + "')"

		sql_str += str_data
		query = client.query (sql_str)

	query.on 'end',() ->
		client.end()
		console.log "*** 終了 ***"
#
# ---------------------------------------------------------------
