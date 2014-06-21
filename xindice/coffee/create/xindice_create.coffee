#! /usr/bin/coffee
# ---------------------------------------------------------------
#	xindice_create.coffee
#
#					Jul/19/2012
# ---------------------------------------------------------------
request = require('request');
xml2js = require('xml2js')
text_manipulate = require('/var/www/data_base/common/coffee_common/text_manipulate')
xml_manipulate = require('/var/www/data_base/common/coffee_common/xml_manipulate')
http_manipulate = require('/var/www/data_base/common/coffee_common/http_manipulate')
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0271','青森',65724,'1954-8-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0272','弘前',57932,'1954-2-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0273','八戸',69741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0274','三沢',38764,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0275','黒石',49871,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0276','むつ',65292,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0277','五所川原',31251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0278','十和田',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t0279','平川',26257,'1954-10-2')

	return dict_aa
# ---------------------------------------------------------------
console.log "*** 開始 ***"

dict_aa = data_prepare_proc()
#
url_src = 'http://host_dbase:8888/xindice/db/cities/cities'

text_manipulate.dict_display_proc (dict_aa)
out_str = xml_manipulate.dict_to_xml_proc(dict_aa)
http_manipulate.put_proc('host_dbase',8888,'/xindice/db//cities/cities',out_str)

console.log	("*** 終了 ***")

# ---------------------------------------------------------------

