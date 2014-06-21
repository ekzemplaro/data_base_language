#! /usr/bin/coffee
# ---------------------------------------------------------------
#	webdav_read.coffee
#
#					Dec/24/2013
# ---------------------------------------------------------------
http = require('http')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
func01 = (body) ->
	dict_aa = JSON.parse (body)
	text_manipulate.dict_display_proc (dict_aa)
	console.log "*** 終了 ***"
# ---------------------------------------------------------------
console.log "*** 開始 ***"

#

options = {
	host: 'host_dbase',
	port: 3004,
	path: '/city/tokyo.json'
	}

http.get options, (res) ->
	data = ''
	res.on 'data', (chunk) ->
		data += chunk.toString()
	res.on 'end', () ->
		func01 data
# ---------------------------------------------------------------
