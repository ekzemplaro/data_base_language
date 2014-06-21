#! /usr/local/bin/coffee
# ---------------------------------------------------------------
#	exist_delete.coffee
#
#					Sep/19/2011
# ---------------------------------------------------------------
request = require('request');
xml2js = require('xml2js-expat')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
xml_manipulate = require('/var/www/data_base/common/coffee_common/xml_manipulate')
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"
id_in = process.argv[2]

console.log id_in

parser = new xml2js.Parser()
#
url_src = 'http://localhost:8086/exist/rest/db/cities/cities.xml'
request.get {uri:url_src, json: true },(error, response, body) ->
	parser.parseString(body)

parser.on 'end', (dict_aa) ->
	delete dict_aa[id_in]
	text_manipulate.dict_display_proc (dict_aa)
	out_str = xml_manipulate.dict_to_xml_proc(dict_aa)
#	http_manipulate.put_proc('localhost',8086,'/exist/rest/db//cities/cities.xml',out_str)
	console.log	("*** 終了 ***")

# ---------------------------------------------------------------

