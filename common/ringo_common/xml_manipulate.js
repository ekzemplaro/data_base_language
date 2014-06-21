// ------------------------------------------------------------------
//
//	xml_manipulate.js
//
//						Dec/27/2013
//
// ------------------------------------------------------------------
var fs= require ("fs");

var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------
exports.xml_to_dict_proc = xml_to_dict_proc
exports.dict_to_xml_proc = dict_to_xml_proc
// ------------------------------------------------------------------
function xml_to_dict_proc (str_xml)
{
	str_xml=str_xml.replace('<?xml version="1.0"?>', ""); // bug 336551
	str_xml=str_xml.replace('<?xml version="1.0" encoding="utf-8"?>', "");
	str_xml=str_xml.replace('\n', "");

	var xx_dict = new XML (str_xml);

print (xx_dict.*.length ());
print (xx_dict.length ());

	var dict_aa = new Object ();

	for each (var node in xx_dict.*)
		{
		dict_aa = text_manipulate.dict_append_proc
		 (dict_aa,node.name(),node.name,node.population,node.date_mod);
		}

	return	dict_aa;
}

// ------------------------------------------------------------------
function dict_to_xml_proc (dict_aa)
{

	var out_str = '<?xml version="1.0" encoding="utf-8"?>\n'
//	var out_str = '<?xml version="1.0"?>\n'
	out_str += '<root>\n';

	for (var id in dict_aa)
		{
		out_str += "<" + id + ">";
		out_str += "<name>" + dict_aa[id]["name"] + "</name>";
		out_str += "<population>" + dict_aa[id]["population"] + "</population>";
		out_str += "<date_mod>" + dict_aa[id]["date_mod"] + "</date_mod>";
		out_str += "</" + id + ">\n";
		}

	out_str += "</root>";

//	print (out_str);

	return	out_str;

}
// ------------------------------------------------------------------
