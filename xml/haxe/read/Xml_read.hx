// --------------------------------------------------------------
//	Xml_read.hx
//
//						Feb/11/2016
// --------------------------------------------------------------
class Xml_read
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
	Sys.println ("*** 開始 ***");

	var xml_file = Sys.args ()[0];

	Sys.println (xml_file);

	var str_xml = sys.io.File.getContent (xml_file);

	var dict_aa = Xml_manipulate.xml_to_dict_proc (str_xml);

	Text_manipulate.dict_display_proc (dict_aa);

	Sys.println ("*** 終了 ***");
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
