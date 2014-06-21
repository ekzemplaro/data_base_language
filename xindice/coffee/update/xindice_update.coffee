#! /usr/bin/coffee
# ---------------------------------------------------------------
#	xindice_update.coffee
#
#					Jul/19/2012
# ---------------------------------------------------------------
request = require('request');
xml2js = require('xml2js')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
xml_manipulate = require('/var/www/data_base/common/coffee_common/xml_manipulate')
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate')
# ---------------------------------------------------------------
console.log "*** 開始 ***"
id_in = process.argv[2]
population_in = process.argv[3]

console.log id_in + "\t" + population_in

parser = new xml2js.Parser()
#
url_src = 'http://host_dbase:8888/xindice/db/cities/cities'
request.get {uri:url_src, json: true },(error, response, body) ->
	parser.parseString(body)

parser.on 'end', (result) ->
	dict_aa=text_manipulate.dict_update_proc(result,id_in,population_in)
	text_manipulate.dict_display_proc (result)
	out_str = xml_manipulate.dict_to_xml_proc(dict_aa)
	http_manipulate.put_proc('host_dbase',8888,'/xindice/db//cities/cities',out_str)
	console.log	("*** 終了 ***")

# ---------------------------------------------------------------

