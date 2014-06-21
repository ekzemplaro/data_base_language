# ---------------------------------------------------------------
#	json_manipulate.coffee
#
#					Aug/09/2013
# ---------------------------------------------------------------
text_manipulate = require('./text_manipulate')
# ---------------------------------------------------------------
exports.json_update_proc = (json_str,population_in) ->
	data = eval('('+json_str+')')
	unit_aa = {}
	unit_aa['name'] = data.name
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = text_manipulate.get_current_date_proc()

	json_out = JSON.stringify (unit_aa)
#
	return	json_out
# ---------------------------------------------------------------
exports.json_display_proc = (key,json_str) ->
	out_str = key + "\t"
	data = eval('('+json_str+')')
	out_str  += data.name + "\t"
	out_str += data.population + "\t"
	out_str += data.date_mod
	console.log (out_str)
#
# ---------------------------------------------------------------
