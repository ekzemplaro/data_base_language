// --------------------------------------------------------------
//
//	Text_manipulate.hx
//
//					Feb/24/2014
//
// --------------------------------------------------------------
class Text_manipulate
// --------------------------------------------------------------
{
// --------------------------------------------------------------
public static function text_to_dict_proc (fname_in:String): Map <String,Map<String,String>>
{
	var delimit = "\t";

	var dict_aa = text_to_dict_proc_exec (fname_in,delimit);

	return	dict_aa;
}

// --------------------------------------------------------------
static function text_to_dict_proc_exec (fname_in:String,delimit:String)
	: Map <String,Map<String,String>>
{
	var dict_aa = new Map ();

	var fin = sys.io.File.read (fname_in, false);
	try
	{
	var lineNum = 0;
	while( true )
		{
		var str = fin.readLine();
		var cols = str.split (delimit);
		var population = Std.parseInt (cols[2]);
		dict_aa = dict_append_proc
				(dict_aa,cols[0],cols[1],population,cols[3]);
		}
	}
	catch( ex:haxe.io.Eof ) 
	{}
	fin.close();

	return	dict_aa;
}

// --------------------------------------------------------------
public static function dict_append_proc (dict_aa:Map <String,Map<String,String>>,
	key:String,name:String,population:Int,date_mod:String)
	: Map <String,Map<String,String>>
{
	var unit_aa = unit_insert_proc (name,population,date_mod);
	dict_aa.set (key,unit_aa);

	return	dict_aa;
}

// --------------------------------------------------------------
static function unit_insert_proc (name:String,population:Int,date_mod:String)
	: Map <String,String> 
{
	var unit_aa = new Map ();
	unit_aa.set ("name",name);
	var str_pop = Std.string (population);
	unit_aa.set ("population",str_pop);
	unit_aa.set ("date_mod",date_mod);

	return unit_aa;
}

// --------------------------------------------------------------
public static function dict_to_text_proc 
	(fname_out:String,dict_aa: Map <String,Map<String,String>>) : Void
{
	var delimit = "\t";
	var fout = sys.io.File.write (fname_out, false);

	for (key in dict_aa.keys ())
		{
		var unit_bb = dict_aa.get (key);
		var str_out = unit_to_string_proc (delimit,key,unit_bb);
		fout.writeString (str_out + "\n");
		}

	fout.close();
}

// --------------------------------------------------------------
public static function dict_display_proc (dict_aa : Map <String,Map<String,String>>) : Void
{
	var delimit = "\t";

	for (key in dict_aa.keys ())
		{
		var unit_bb = dict_aa.get (key);
		var str_out = unit_to_string_proc (delimit,key,unit_bb);
       		Sys.println (str_out);
		}

}

// --------------------------------------------------------------
static function unit_to_string_proc
	(delimit:String,key:String,unit_bb: Map <String,String>) : String
{
	var str_out = key + delimit + unit_bb.get ("name");
	str_out += delimit + unit_bb.get ("population");
	str_out += delimit + unit_bb.get ("date_mod");

	return	str_out;
}

// --------------------------------------------------------------
public static function csv_to_dict_proc (fname_in:String): Map <String,Map<String,String>>
{
	var delimit = ",";

	var dict_aa = text_to_dict_proc_exec (fname_in,delimit);

	return	dict_aa;
}

// --------------------------------------------------------------
public static function dict_to_csv_proc 
	(fname_out:String,dict_aa: Map <String,Map<String,String>>) : Void
{
	var delimit = ",";
	var fout = sys.io.File.write (fname_out, false);

	for (key in dict_aa.keys ())
		{
		var unit_bb = dict_aa.get (key);
		var str_out = unit_to_string_proc (delimit,key,unit_bb);
		fout.writeString (str_out + "\n");
		}

	fout.close();
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
