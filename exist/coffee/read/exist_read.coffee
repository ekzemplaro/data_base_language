#! /usr/bin/coffee
# ---------------------------------------------------------------
#	exist_read.coffee
#
#					Oct/03/2012
# ---------------------------------------------------------------
request = require('request')
xml2js = require('xml2js')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"

parser = new xml2js.Parser()
#
url_src = 'http://localhost:8086/exist/rest//db/cities/cities.xml'
request.get {uri:url_src, json: true },(error, response, body) ->
	parser.parseString(body)

parser.on 'end', (result) ->
	text_manipulate.dict_display_proc (result)
	console.log	("*** 終了 ***")


# ---------------------------------------------------------------

