// --------------------------------------------------------------
//
//	mcache_manipulate.js
//
//					Jun/23/2011
//
//
// --------------------------------------------------------------
function mcache_read_single (mc,key)
{
	var str_json  = mc.get (key);

//        print (str_json);

	if (str_json != null)
	{
	var unit_aa = JSON.parse (str_json);
	var name = unit_aa["name"];
	var population = unit_aa["population"];
	var date_mod = unit_aa["date_mod"];

	var out_str = key + "\t" + name + "\t";
	out_str += population + "\t" + date_mod;
	print (out_str);
	}

}

// --------------------------------------------------------------
function mcache_update_proc (mc,key,population)
{
	var str_json  = mc.get(key);

	print ("key = " + key);
	print ("str_json = " + str_json);

	if (str_json != null)
	{
	var unit_aa = JSON.parse (str_json);
	var name = unit_aa["name"];

	unit_aa['population'] = population;
	unit_aa['date_mod'] = get_current_date_proc ();

	print ("key = " + key);

	var json_new = JSON.stringify (unit_aa);

	print (json_new);

	var rc = mc.set (key,json_new);
	}
}

// --------------------------------------------------------------
function data_put_proc (mc,key,name,population,date_mod)
{
	var unit_aa = Object ();
}

// --------------------------------------------------------------
