/*
	text_manipulate.dart

					Mar/17/2015
*/
// -------------------------------------------------------------
import 'dart:io';
// -------------------------------------------------------------
disp_unit_proc (key,value) {
	String str_out = key + "\t" + value["name"] + "\t" + value["population"] + "\t" + value["date_mod"];
	print (str_out);
}

// -------------------------------------------------------------
dict_display_proc (dict_aa)
{
	dict_aa.forEach((key,value) => disp_unit_proc (key,value));
}

// -------------------------------------------------------------
str_to_dict_proc (content,delim)
{
	var dict_aa = new Map ();

	List<String> lines = content.split ("\n");

	for (final line in lines)
		{
		var unit_aa = new Map ();
		List<String> cols = line.split (delim);
		if (3 < cols.length)
			{
			unit_aa["name"] = cols[1];
			unit_aa["population"] = cols[2];
			unit_aa["date_mod"] = cols[3];
			dict_aa[cols[0]] = unit_aa;
			}
		}

	return	dict_aa;
}

// -------------------------------------------------------------
dict_append_proc (dict_aa,key,name,population,date_mod)
{
	var unit_aa = new Map ();

	unit_aa["name"] = name;
	unit_aa["population"] = population.toString();
	unit_aa["date_mod"] = date_mod;
	dict_aa[key] = unit_aa;

	return	dict_aa;
}

// -------------------------------------------------------------
write_unit_proc (sink,delim,key,value)
{
	String str_out = key + delim + value["name"] + delim + value["population"] + delim + value["date_mod"];

	sink.write(str_out + '\n');
}

// -------------------------------------------------------------
dict_to_text_proc (delim,dict_aa,file_out)
{
	var file = new File (file_out);
	var sink = file.openWrite ();

	dict_aa.forEach((key,value) => write_unit_proc (sink,delim,key,value));

	sink.close();
}

// -------------------------------------------------------------
dict_update_proc (dict_aa,key,population)
{
	var today = new DateTime.now();

	dict_aa[key]["population"] = population.toString ();
	dict_aa[key]["date_mod"] = today.toString ();

	return	dict_aa; 
}

// -------------------------------------------------------------
str_to_file_proc (str_out,file_out)
{
	var file = new File (file_out);
	var sink = file.openWrite ();
	sink.write (str_out);
	sink.close ();
}

// -------------------------------------------------------------
