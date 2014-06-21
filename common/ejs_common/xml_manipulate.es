// ------------------------------------------------------------------
//
//	xml_manipulate.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
exports.xml_to_dict_proc = xml_to_dict_proc
exports.dict_to_xml_proc = dict_to_xml_proc
// ------------------------------------------------------------------

// ------------------------------------------------------------------
function xml_to_dict_proc (str_xml)
{
	str_xml=str_xml.replace('<?xml version="1.0"?>', "") // bug 336551
	str_xml=str_xml.replace('<?xml version="1.0" encoding="utf-8"?>', "")
	str_xml=str_xml.replace('\n', "")

	var xx_dict = new XML (str_xml)

print (xx_dict.*.length ())
print (xx_dict.length ())

	var dict_aa = new Object ()

	for each (var node in xx_dict.*)
		{
		var key = node.name ()

//		var out_str = key + "\t" + node.name + "\t" + node.population
//		out_str += "\t" + node.date_mod
//		print (out_str)

		var unit_aa = {}
		unit_aa['name'] = node.name
		unit_aa['population'] = node.population
		unit_aa['date_mod'] = node.date_mod

		dict_aa[key] = unit_aa
		}

	return	dict_aa
}

// ------------------------------------------------------------------
function dict_to_xml_proc (dict_aa)
{

	var out_str = '<?xml version="1.0" encoding="utf-8"?>\n'
//	var out_str = '<?xml version="1.0"?>\n'
	out_str += '<root>\n'

	for (var id in dict_aa)
		{
		out_str += "<" + id + ">"
		out_str += "<name>" + dict_aa[id]["name"] + "</name>"
		out_str += "<population>" + dict_aa[id]["population"] + "</population>"
		out_str += "<date_mod>" + dict_aa[id]["date_mod"] + "</date_mod>"
		out_str += "</" + id + ">\n"
		}

	out_str += "</root>"

//	print (out_str)

	return	out_str

}
// ------------------------------------------------------------------
