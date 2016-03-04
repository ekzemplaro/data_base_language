// --------------------------------------------------------------
//	Xml_update.hx
//
//						Feb/11/2016
// --------------------------------------------------------------
class Xml_update
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var xml_file = Sys.args ()[0];

	var key: String = Sys.args ()[1];
	var population = Std.parseInt (Sys.args ()[2]);

	Sys.println (xml_file);
	Sys.println (key);
	Sys.println (population);

	var str_xml = sys.io.File.getContent (xml_file);

	var dict_aa = Xml_manipulate.xml_to_dict_proc (str_xml);

	if (dict_aa.exists (key))
		{
		dict_aa = Text_manipulate.dict_update_proc (dict_aa,key,population);
		Sys.println ("*** key exists ***");

		var str_out = Xml_manipulate.dict_to_xml_proc (dict_aa);

		var fout = sys.io.File.write (xml_file, false);

		fout.writeString (str_out);

		fout.close();
		}

	Sys.println ("*** 終了 ***");
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
