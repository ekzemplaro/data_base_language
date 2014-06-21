#! /usr/bin/coffee
# ---------------------------------------------------------------
#	exist_create.coffee
#
#					Oct/03/2012
# ---------------------------------------------------------------
request = require('request');
xml2js = require('xml2js')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
xml_manipulate = require('/var/www/data_base/common/coffee_common/xml_manipulate')
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate')
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4251','長崎',24836,'1954-8-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4252','佐世保',79632,'1954-2-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4253','島原',69741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4254','大村',38764,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4255','諫早',49871,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4256','五島',65292,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4257','平戸',31251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4258','雲仙',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t4259','松浦',26257,'1954-10-2')

	return dict_aa
# ---------------------------------------------------------------
console.log "*** 開始 ***"

dict_aa = data_prepare_proc()
#

text_manipulate.dict_display_proc (dict_aa)
out_str = xml_manipulate.dict_to_xml_proc(dict_aa)
console.log (out_str)
http_manipulate.put_proc('localhost',8086,'/exist/rest/db//cities/cities.xml',out_str)

console.log	("*** 終了 ***")

# ---------------------------------------------------------------

