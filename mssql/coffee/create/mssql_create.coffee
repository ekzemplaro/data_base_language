#! /usr/bin/coffee
# ---------------------------------------------------------------
#	mssql_create.coffee
#
#					Jul/03/2014
#
# ---------------------------------------------------------------
mssql = require('mssql')
text_manipulate= require('/var/www/data_base/common/node_common/text_manipulate')
sql_manipulate= require('/var/www/data_base/common/node_common/sql_manipulate')

# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1071','前橋',16473,'1954-7-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1072','高崎',45297,'1954-8-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1073','桐生',64871,'1954-11-19')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1074','沼田',86974,'1954-6-17')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1075','伊勢崎',31258,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1076','水上',65792,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1077','太田',37251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1078','安中',59486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t1079','みどり',21957,'1954-10-2')
	
	return	dict_aa

# ---------------------------------------------------------------
console.log "*** 開始 ***"

config = {
	user: 'sa',
	password: 'scott_tiger',
	server: 'host_mssql',
	database: 'city',
}

dict_aa = data_prepare_proc()

connection = new mssql.Connection(config, (err) ->
	request = new mssql.Request(connection)
	request.query('drop table cities')

	command = 'create table cities (id varchar(10), name varchar(20),'
	command += ' population int, date_mod date)'

	request.query(command, (err, rows) ->
		for key of dict_aa
#			console.log (key)
			sql_str  = "insert into cities "
			sql_str += "(id,name,population,date_mod) values ("

			str_data = "'" + key + "','" + dict_aa[key].name
			str_data += "'," + dict_aa[key].population
			str_data += ",'" + dict_aa[key].date_mod + "')"

			sql_str += str_data
			request.query (sql_str)

		connection.close()
		console.log "*** 終了 ***"
	)
)

# ---------------------------------------------------------------
