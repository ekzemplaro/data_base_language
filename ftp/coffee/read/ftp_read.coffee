#! /usr/bin/coffee
# ---------------------------------------------------------------
#	ftp_read.coffee
#
#					Aug/19/2013
# ---------------------------------------------------------------
text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate')
# ---------------------------------------------------------------
proc01 = (conn) ->
	console.log ("*** ppp ***")

	conn.get 'city/iwate.json', (ee, stream) ->
		if ee
			throw ee

		stream.on 'success', ->
			conn.end()

		stream.on 'error', (ee) ->
			console.log('ERROR during get(): ' + util.inspect(ee))
			conn.end()

		stream.on 'data', (data) ->
			dict_aa = JSON.parse (data)
			text_manipulate.dict_display_proc (dict_aa)
			console.log ("*** 終了 ***")
			
# ---------------------------------------------------------------
console.log ("*** 開始 ***")

FTPClient = require('ftp')
util = require('util')

conn = new FTPClient({ host: 'host_dbase'})

conn.on 'connect', ->
	conn.auth 'scott','tiger', (ee) ->
		if (ee)
			throw ee

		proc01 (conn)

conn.connect()

# ---------------------------------------------------------------
