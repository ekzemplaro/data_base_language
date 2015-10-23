// ---------------------------------------------------------------
//	xml_manipulate.js
//
//					Jul/23/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("./text_manipulate");

// ---------------------------------------------------------------
exports.dict_to_xml_proc = function (dict_aa)
{
var out_str = "<?xml version=\"1.0\"?>";

	out_str +=  '<root>\n';

	for (var id in dict_aa)
		{
		if (id)
			{
			var unit_aa = dict_aa[id];
			out_str += '<' + id + '>';
			out_str += tag_gen_proc ("name",unit_aa["name"]);
			out_str += tag_gen_proc ("population",unit_aa["population"]);
			out_str += tag_gen_proc ("date_mod",unit_aa["date_mod"]);
			out_str += '</' + id + '>\n';
			}
		}
	out_str +=  '</root>\n';

	return	out_str;
}

// ---------------------------------------------------------------
function tag_gen_proc (tag,value)
{
	var out_str = '<' + tag + '>';
	out_str += value +  '</' + tag + '>';

	return	out_str;
}

// ---------------------------------------------------------------
