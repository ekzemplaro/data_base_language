// --------------------------------------------------------------------
/*
	text_manipulate.cs

					Feb/09/2015

*/
// --------------------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;

//using	Newtonsoft.Json;

// --------------------------------------------------------------------
public class	text_manipulate
{
// --------------------------------------------------------------------
public static Dictionary <string,Object>
	text_read_proc (String file_in)
{
//	char [] delimeters = new char [] {',',' ','\t'};
	char [] delimeters = new char [] {' ','\t'};

	Dictionary <string,Object> dict_aa
		= text_read_proc_exec (file_in,delimeters);

	return	dict_aa;
}

// --------------------------------------------------------------------
static Dictionary <string,Object>
	text_read_proc_exec (String file_in,char [] delimeters)
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	StreamReader sr = new StreamReader (file_in);

	string	buff;


	while ((buff = sr.ReadLine ()) != null)
		{
		string [] cols = buff.Split (delimeters);

		Dictionary <string,string> unit_aa
			= new Dictionary <string,string> ();

		unit_aa.Add ("name",cols[1]);
		unit_aa.Add ("population",cols[2]);
		unit_aa.Add ("date_mod",cols[3]);

		dict_aa.Add (cols[0],unit_aa);
		}

	sr.Close();

	return	dict_aa;
}

// --------------------------------------------------------------------
public static void dict_display_proc (Dictionary <string,Object> dict_aa)
{
	Console.WriteLine ("*** dict_display_proc ***");

	SortedDictionary<string,Object> dict_bb
		= new SortedDictionary<string,Object>(dict_aa);

	foreach (KeyValuePair<string, Object> kv in dict_bb)
		{
		if ((kv.Key != "_id") && (kv.Key != "_rev"))
			{
			Dictionary <string,string> unit_aa
				= (Dictionary <string,string>)kv.Value;

			string out_str = kv.Key + "\t";
			out_str += unit_aa["name"] + "\t";
			out_str += unit_aa["population"] + "\t";
			out_str += unit_aa["date_mod"] + "\n";
			Console.Write (out_str);
			}

		}
}

// --------------------------------------------------------------------
public static void text_write_proc (String file_out,
	Dictionary <string,Object> dict_aa)
{
	char delimit = '\t';

	text_write_proc_exec (file_out,dict_aa,delimit);
}

// --------------------------------------------------------------------
public static void text_write_proc_exec (String file_out,
	Dictionary <string,Object> dict_aa,char delimit)
{
	string out_str = "";

	foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Dictionary <string,string> unit_aa
			= (Dictionary <string,string>)kv.Value;

		out_str += (kv.Key + delimit);
		out_str += (unit_aa["name"] + delimit);
		out_str += (unit_aa["population"] + delimit);
		out_str += (unit_aa["date_mod"] + "\n");
		}

	StreamWriter fp_out = new StreamWriter (file_out);

	fp_out.Write (out_str);

	fp_out.Close ();
}

// --------------------------------------------------------------------
public static Dictionary <string,Object> dict_append_proc
	(Dictionary <string,Object> dict_aa,
	String id_in,String name_in,int population_in,String date_mod)
{
	Dictionary <string,string> unit_aa
			= new Dictionary <string,string> ();

	unit_aa.Add ("name",name_in);
	unit_aa.Add ("population",population_in.ToString ());
	unit_aa.Add ("date_mod",date_mod);

	dict_aa.Add (id_in,unit_aa);

	return	dict_aa;
}

// --------------------------------------------------------------------
public static Dictionary <string,Object> dict_update_proc
	(Dictionary <string,Object> dict_aa,String key,int population_in)
{
	DateTime dateNow = DateTime.Now;
	string str_date = dateNow.ToString ();

	String str_population = population_in.ToString ();

Console.WriteLine ("*** update_proc aaa ***");
	if (dict_aa.ContainsKey (key))
		{
	Console.WriteLine ("*** update_proc bbb *** key = " + key);


	Dictionary <string,string> unit_aa
				= (Dictionary <string,string>)dict_aa[key];


		unit_aa["population"] = str_population;
		unit_aa["date_mod"] = str_date;

		dict_aa.Remove (key);
		dict_aa.Add (key,unit_aa);
		}

	return	dict_aa;
}

// --------------------------------------------------------------------
public static Dictionary <string,Object> csv_read_proc (String file_in)
{
	char [] delimeters = new char [] {','};

	Dictionary <string,Object> dict_aa
		= text_read_proc_exec (file_in,delimeters);

	return	dict_aa;
}

// --------------------------------------------------------------------
public static void csv_write_proc (String file_out,
	Dictionary <string,Object> dict_aa)
{
	char delimit = ',';

	text_write_proc_exec (file_out,dict_aa,delimit);
}

// --------------------------------------------------------------------
/*
public static void data_prepare_unit (ref Cities cities_aa,
	String id_in,String name_in,int population_in,String date_mod_in)
{

	City city_ff = new City();
	city_ff.set (id_in,name_in,population_in,date_mod_in);

	cities_aa.set (city_ff);
}
*/
// --------------------------------------------------------------------
/*
public static string to_string_proc (Cities cities_aa)
{
	string out_str = "";

	foreach (City city_ff in cities_aa.list_aa)
		{
		Console.Write (city_ff.id + "\t");
		Console.Write (city_ff.name + "\t");
		Console.Write (city_ff.population + "\t");
		Console.WriteLine (city_ff.date_mod);

		out_str += (city_ff.id + "\t");
		out_str += (city_ff.name + "\t");
		out_str += (city_ff.population + "\t");
		out_str += (city_ff.date_mod + "\n");
		}

	return	out_str;
}
*/

// --------------------------------------------------------------------
/*
public static string to_json_string_proc (Cities cities_aa)
{
	string out_str = "{\"cities\":[";

	int nnx = cities_aa.list_aa.Count;

	for (int it=0; it < cities_aa.list_aa.Count; it++)
		{
	string str_out_bb = JsonConvert.SerializeObject (cities_aa.list_aa[it]);
		out_str += str_out_bb;

		if (it < (nnx - 1))
			{
			out_str += ",";
			}
		else
			{
			out_str += "]";
			}
		}

	out_str += "}";

	return	out_str;
}
*/
// --------------------------------------------------------------------
}

// --------------------------------------------------------------------
