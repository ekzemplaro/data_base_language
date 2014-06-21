#! /usr/bin/coffee
# ---------------------------------------------------------------
#	webdav_update.coffee
#
#					Dec/24/2012
# ---------------------------------------------------------------
http = require 'http'
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

id_in=process.argv[2]
population_in=process.argv[3]

console.log (id_in + "\t" + population_in)

options = {
	host: 'host_dbase',
	port: 3004,
	path: '/city/tokyo.json'
	}

http.get options, (res) ->
	json_str = ''
	res.on 'data', (chunk) ->
		json_str += chunk.toString()
	res.on 'end', () ->
		dict_aa = JSON.parse(json_str)
		dict_aa = text_manipulate.dict_update_proc(dict_aa,id_in,population_in)
		text_manipulate.dict_display_proc(dict_aa)

		string_out = JSON.stringify(dict_aa)

		http_manipulate.put_proc('host_dbase',3004,'/city/tokyo.json',string_out)

		console.log "*** 終了 ***"

# ---------------------------------------------------------------
