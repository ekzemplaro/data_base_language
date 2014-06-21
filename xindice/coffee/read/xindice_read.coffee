#! /usr/bin/coffee
# ---------------------------------------------------------------
#	xindice_read.coffee
#
#					Jul/19/2012
# ---------------------------------------------------------------
request = require('request');
xml2js = require('xml2js')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

parser = new xml2js.Parser()
#
url_src = 'http://host_dbase:8888/xindice/db/cities/cities'
request.get {uri:url_src, json: true },(error, response, body) ->
	parser.parseString(body)

parser.on 'end', (result) ->
	text_manipulate.dict_display_proc (result)
	console.log	("*** 終了 ***")

# ---------------------------------------------------------------

