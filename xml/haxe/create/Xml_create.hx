// --------------------------------------------------------------
//	Xml_create.hx
//
//						Feb/11/2016
// --------------------------------------------------------------
class Xml_create
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function data_prepare_proc ()
{
var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2261","静岡",93851,"1955-10-5");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2262","浜松",29754,"1955-7-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2263","沼津",73156,"1955-5-9");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2264","三島",56928,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2265","富士",61825,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2266","熱海",93486,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2267","富士宮",58497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2268","藤枝",28516,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2269","御殿場",53149,"1955-12-19");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2270","島田",42736,"1955-4-29");

	return	dict_aa;
}

// --------------------------------------------------------------
static function main()
{
	Sys.println ("*** 開始 ***");

	var xml_file = Sys.args ()[0];

	Sys.println (xml_file);

	var dict_aa = data_prepare_proc ();

	var str_out = Xml_manipulate.dict_to_xml_proc (dict_aa);

//	Sys.println (str_out);

	var fout = sys.io.File.write (xml_file, false);

	fout.writeString (str_out);

	fout.close();

	Sys.println ("*** 終了 ***");
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
