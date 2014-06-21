// -----------------------------------------------------------------------
/*
	text_manipulate.java

					Jun/13/2011
*/
// -----------------------------------------------------------------------
import	java.io.File;
import	java.io.FileReader;
import	java.io.FileWriter;
import	java.io.BufferedReader;
import	java.io.BufferedWriter;
import	java.io.PrintWriter;

import	java.util.Date;
import	java.util.HashMap;
import	java.util.Set;

import	java.text.DateFormat;
import	java.text.SimpleDateFormat;


// -----------------------------------------------------------------------
public class text_manipulate
{

// -----------------------------------------------------------------------
static HashMap <String, HashMap<String,String>>
	text_read_proc (String file_in)
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	try
		{
		FileReader in_file = new FileReader (file_in);

		BufferedReader	buff = new BufferedReader (in_file);

		String	line;

		while ((line = buff.readLine ()) != null)
			{
			HashMap <String,String> dict_unit
				= new HashMap <String,String> ();
			String [] cols = line.split ("[, \t]",-1);

			dict_unit.put ("name",cols[1]);
			dict_unit.put ("population",cols[2]);
			dict_unit.put ("date_mod",cols[3]);

			dict_aa.put (cols[0],dict_unit);
			}
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}

	return	dict_aa;
}

// ----------------------------------------------------------------
static void dict_display_proc
	(HashMap <String, HashMap <String,String>> dict_aa)
{
	HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

	System.out.println (dict_aa.size ());

	Set set_aaa = dict_aa.keySet ();
//	System.out.println (set_aaa);

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;

		if ((!key.equals ("_id")) && (!key.equals ("_rev")))
		{
		dict_unit = dict_aa.get (key_aa);
		System.out.print (key_aa + "\t");
		System.out.print (dict_unit.get ("name") + "\t");
		Object ppx = dict_unit.get ("population");
		System.out.print (ppx + "\t");

		System.out.println (dict_unit.get ("date_mod"));
		}
		}
}

// -----------------------------------------------------------------------
static void text_write_proc
	(String file_out,HashMap <String,HashMap <String,String>> dict_aa)
{
	HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

	System.out.println (dict_aa.size ());

	Set set_aaa = dict_aa.keySet ();

	try
	{
	File file = new File (file_out);
	FileWriter filewriter = new FileWriter (file);
	BufferedWriter bw = new BufferedWriter (filewriter);

	PrintWriter pw = new PrintWriter (bw);

	for (Object key_aa: set_aaa)
		{
		dict_unit = dict_aa.get (key_aa);

		String str_out = key_aa + "\t";
		str_out += dict_unit.get ("name") + "\t";
		str_out += dict_unit.get ("population") + "\t";
		str_out += dict_unit.get ("date_mod");

		pw.println (str_out);
		}

	pw.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}

}

// ----------------------------------------------------------------
static HashMap <String, HashMap<String,String>>
dict_update_proc (HashMap <String, HashMap <String,String>> dict_aa,
	String key_aa,int population)
{
	String str_population = Integer.toString (population);

	if (dict_aa.containsKey (key_aa))
	{
	String today = get_current_date_proc ();

	HashMap <String,String> dict_unit = dict_aa.get (key_aa);

	dict_unit.put ("population",str_population);
	dict_unit.put ("date_mod",today);

	dict_aa.put (key_aa,dict_unit);
	}

	return	dict_aa;
}

// -----------------------------------------------------------------------
static HashMap <String, HashMap<String,String>>
dict_delete_proc (HashMap <String, HashMap <String,String>> dict_aa,String key_aa)
{
	if (dict_aa.containsKey (key_aa))
		{
		dict_aa.remove (key_aa);
		}

	return	dict_aa;
}

// -----------------------------------------------------------------------
static HashMap <String, HashMap<String,String>>
dict_append_proc (HashMap <String, HashMap <String,String>> dict_aa,
	String key_aa,String name,int population,String date_mod)
{
//	String key_aa = Integer.toString (id);
	String str_population = Integer.toString (population);

	HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

	dict_unit.put ("name",name);
	dict_unit.put ("population",str_population);
	dict_unit.put ("date_mod",date_mod);

	dict_aa.put (key_aa,dict_unit);

	return	dict_aa;
}

// -----------------------------------------------------------------------
static HashMap <String, HashMap<String,String>>
	csv_read_proc (String file_in)
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	try
		{
		FileReader in_file = new FileReader (file_in);

		BufferedReader	buff = new BufferedReader (in_file);

		String	line;

		while ((line = buff.readLine ()) != null)
			{
			HashMap <String,String> dict_unit
				= new HashMap <String,String> ();
			String [] cols = line.split (",",-1);

			dict_unit.put ("name",cols[1]);
			dict_unit.put ("population",cols[2]);
			dict_unit.put ("date_mod",cols[3]);

			dict_aa.put (cols[0],dict_unit);
			}
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}

	return	dict_aa;
}

// -----------------------------------------------------------------------
static void csv_write_proc
	(String file_out,HashMap <String,HashMap <String,String>> dict_aa)
{
	HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

	System.out.println (dict_aa.size ());

	Set set_aaa = dict_aa.keySet ();

	try
	{
	File file = new File (file_out);
	FileWriter filewriter = new FileWriter (file);
	BufferedWriter bw = new BufferedWriter (filewriter);

	PrintWriter pw = new PrintWriter (bw);

	for (Object key_aa: set_aaa)
		{
		dict_unit = dict_aa.get (key_aa);

		String str_out = key_aa + ",";
		str_out += dict_unit.get ("name") + ",";
		str_out += dict_unit.get ("population") + ",";
		str_out += dict_unit.get ("date_mod");

		pw.println (str_out);
		}

	pw.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}

}

// -----------------------------------------------------------------------
static String get_current_date_proc ()
{
	Date ddx = new Date ();
	DateFormat dfm = new SimpleDateFormat ("yyyy-MM-dd");
	String	str_ddx = dfm.format (ddx);

	return	str_ddx;
}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
