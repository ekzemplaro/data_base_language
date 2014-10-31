#! /usr/bin/coffee
#
#	csv_create.coffee
#
#					Oct/22/2014
# -------------------------------------------------------------
fs = require('fs')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# -------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = []
	dict_aa["t1271"] = {"name": "千葉", "population": 31587, "date_mod": "1954-3-12"}
	dict_aa["t1272"] = {"name": "勝浦", "population": 56812, "date_mod": "1954-7-15"}
	dict_aa["t1273"] = {"name": "市原", "population": 79123, "date_mod": "1954-2-24"}
	dict_aa["t1274"] = {"name": "流山", "population": 62538, "date_mod": "1954-8-16"}
	dict_aa["t1275"] = {"name": "八千代", "population": 79834, "date_mod": "1954-9-8"}
	dict_aa["t1276"] = {"name": "我孫子", "population": 82136, "date_mod": "1954-3-25"}
	dict_aa["t1277"] = {"name": "鴨川", "population": 13972, "date_mod": "1954-4-19"}
	dict_aa["t1278"] = {"name": "銚子", "population": 93854, "date_mod": "1954-5-18"}
	dict_aa["t1279"] = {"name": "市川", "population": 13697, "date_mod": "1954-2-1"}

	return dict_aa
# -------------------------------------------------------------
#
console.log "*** 開始 ***\n"
file_out = process.argv[2]
console.log file_out
dict_aa = data_prepare_proc()
text_manipulate.dict_display_proc(dict_aa)
out_str = text_manipulate.dict_to_str_proc(dict_aa,",")
fs.writeFile(file_out, out_str)
#
console.log "*** 終了 ***\n"
# -------------------------------------------------------------
