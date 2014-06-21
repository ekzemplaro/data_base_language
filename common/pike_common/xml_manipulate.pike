//
//	xml_manipulate.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
string tag_out_proc (string tag,string value)
{
	string out_str = "\t<" + tag + ">";

	out_str += value;

	out_str += "</" + tag + ">\n";

	return	out_str;
}

// ----------------------------------------------------------------
string xml_row_generate_proc
	(mapping(string:mapping(string:string)) dict_aa,string key)
{
	string out_str = "<";
	out_str += key;
	out_str += ">";
	out_str += tag_out_proc ("name",dict_aa[key]["name"]);
	out_str += tag_out_proc ("population",dict_aa[key]["population"]);
	out_str += tag_out_proc ("date_mod",dict_aa[key]["date_mod"]);
	out_str += "</";
	out_str += key;
	out_str += ">";

	return	out_str;
}

// ----------------------------------------------------------------
string dict_to_xml_proc (mapping(string:mapping(string:string)) dict_aa)
{
	string str_out = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
	str_out += "<root>\n";

	array aa = indices (dict_aa);

	write (sprintf ("%d\n",sizeof (aa)));

	foreach (aa, string key)
		{
		str_out += xml_row_generate_proc (dict_aa,key);
		}

	str_out += "</root>\n";

	return	(str_out);
}

// ----------------------------------------------------------------
