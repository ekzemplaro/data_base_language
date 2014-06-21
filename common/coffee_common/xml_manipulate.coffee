# ---------------------------------------------------------------
#	xml_manipulate.coffee
#
#					Sep/19/2011
#
# ---------------------------------------------------------------
fs = require("fs")
text_manipulate=require("./text_manipulate")

# ---------------------------------------------------------------
exports.dict_to_xml_proc = (dict_aa) ->
	out_str = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

	out_str +=  '<root>\n'

	for key,value of dict_aa
		if key
			out_str += '<' + key + '>'
			out_str += tag_gen_proc("name",value["name"])
			out_str += tag_gen_proc("population",value["population"])
			out_str += tag_gen_proc("date_mod",value["date_mod"])
			out_str += '</' + key + '>\n'
	out_str +=  '</root>\n'

	return	out_str

# ---------------------------------------------------------------
tag_gen_proc = (tag,value) ->
	out_str = '<' + tag + '>'
	out_str += value +  '</' + tag + '>'

	return	out_str

# ---------------------------------------------------------------
