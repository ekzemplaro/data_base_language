// ----------------------------------------------------------------
//	text_manipulate.pike
//
//						Sep/12/2013
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
void display_record_proc
	(mapping (string:mapping(string:string)) dict_aa,string key)
{
	write (key);
	write ("\t");
	write (dict_aa[key]["name"]);
	write ("\t");
	string str_population = (string)dict_aa[key]["population"];
	write (str_population);
	write ("\t");
	write (dict_aa[key]["date_mod"]);
	write ("\n");
}

// ----------------------------------------------------------------
void	dict_display_proc
	(mapping(string:mapping(string:string)) dict_aa)
{
	write (sprintf ("%d\n",sizeof (dict_aa)));

	array aa = indices (dict_aa);

	foreach (aa, string key)
		{
		if ((key != "_rev") && (key != "_id"))
			{
			display_record_proc (dict_aa, key);
			}
		}
}

// ----------------------------------------------------------------
mapping(string:mapping(string:string)) dict_append_proc
	(mapping(string:mapping(string:string)) dict_aa,
	string key,string name,string population,string date_mod)
{
	mapping(string:string) unit_pp
	 =(["name":name, "population": population, "date_mod": date_mod]);

	dict_aa[key] = unit_pp;

	return	dict_aa;
}

// ----------------------------------------------------------------
mapping(string:mapping(string:string)) text_read_proc_exec
	(string file_in,string delimit)
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	string content=Stdio.File(file_in)->read();

	array(string) bb = content / "\n";

	write (sprintf ("%d\n",sizeof (bb)));

	foreach (bb, string line)
		{
		if (0 < sizeof (line))
			{
			array(string) wrd = line / delimit;
			dict_aa =  dict_append_proc
				(dict_aa,wrd[0],wrd[1],wrd[2],wrd[3]);
			}
		}

	return	dict_aa;
}

// ----------------------------------------------------------------
mapping(string:mapping(string:string)) text_read_proc (string file_in)
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	string delimit = "\t";

	dict_aa = text_read_proc_exec (file_in,delimit);

	return	dict_aa;
}

// ----------------------------------------------------------------
string row_generate_proc
	(mapping(string:mapping(string:string)) dict_aa,
	string key,string delimit)
{
	string	string_out = key;

	string_out += delimit;
	string_out += dict_aa[key]["name"];
	string_out += delimit;
	string_out += dict_aa[key]["population"];
	string_out += delimit;
	string_out += dict_aa[key]["date_mod"];
	string_out += "\n";

	return	string_out;
}

// ----------------------------------------------------------------
void text_write_proc_exec (string file_out,
	mapping(string:mapping(string:string)) dict_aa,string delimit)
{
	string str_out = "";

	array aa = indices (dict_aa);

	write (sprintf ("%d\n",sizeof (aa)));

	foreach (aa, string key)
		{
		str_out += row_generate_proc (dict_aa, key, delimit);
		}

	write_file (file_out,str_out,0777);
}

// ----------------------------------------------------------------
void text_write_proc (string file_out,
	mapping(string:mapping(string:string)) dict_aa)
{
	string	delimit = "\t";

	text_write_proc_exec (file_out,dict_aa,delimit);
}

// ----------------------------------------------------------------
mapping(string:mapping(string:string)) dict_update_proc
	(mapping(string:mapping(string:string)) dict_aa,
	string key,string population_in)
{
	string today = get_current_date_proc ();

	display_record_proc (dict_aa, key);

	dict_aa[key]["population"] = population_in;
	dict_aa[key]["date_mod"] = today;

	return	dict_aa;
}

// ----------------------------------------------------------------
mapping(string:mapping(string:string)) csv_read_proc (string file_in)
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	string delimit = ",";

	dict_aa = text_read_proc_exec (file_in,delimit);

	return	dict_aa;
}

// ----------------------------------------------------------------
void csv_write_proc (string file_out,
	mapping(string:mapping(string:string)) dict_aa)
{
	string	delimit = ",";

	text_write_proc_exec (file_out,dict_aa,delimit);
}

// ----------------------------------------------------------------
string get_current_date_proc ()
{
	mapping(string:int) ttx = localtime (time ());

	string today = sprintf("%d-%d-%d",
		ttx["year"] + 1900,ttx["mon"] + 1,ttx["mday"]);

	return	today;
}

// ----------------------------------------------------------------
