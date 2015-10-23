// ----------------------------------------------------------------
//
//	gdbm_manipulate.pike
//
//						Aug/26/2013
//
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) gdbm_to_dict_proc (string file_gdbm)
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	object db = Gdbm.gdbm (file_gdbm,"r");

	for(string key=db->firstkey(); key; key=db->nextkey(key))
		{
		string value = db->fetch(key);

//		write(key+": "+ value +"\n");

		mapping(string:string) unit_aa
			= Standards.JSON.decode (value);
		string name = unit_aa["name"];
		string population = (string)unit_aa["population"];
		string date_mod = unit_aa["date_mod"];
		dict_aa =  dict_append_proc (dict_aa,key,name,population,date_mod);
		}

	db->close ();

	return dict_aa;
}

// ----------------------------------------------------------------
int dict_to_gdbm_proc (mapping(string:mapping(string:string)) dict_aa,string file_gdbm)
{
	array aa = indices (dict_aa);

	object db = Gdbm.gdbm (file_gdbm,"wc");

	foreach (aa, string key)
		{
		mapping(string:string) unit_aa = dict_aa[key];

		string json_str = Standards.JSON.encode(unit_aa);
//		write (json_str + "\n");

		db->store (key,json_str);
		}

	db->close ();

	return 0;
}

// ----------------------------------------------------------------
