// ----------------------------------------------------------------
/*
	csharp_common/table_manipulate.cs

					May/23/2013

*/
// ----------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	System.IO;
//

[assembly: CLSCompliant(true)]
// ----------------------------------------------------------------
public static class	table_manipulate
{
// ----------------------------------------------------------------
public static DataTable table_prepare_proc ()
{
	DataTable dtable = new DataTable ("cities");

	dtable.Columns.Add (new DataColumn ("id",typeof (string)));
	dtable.Columns.Add (new DataColumn ("name",typeof (string)));
	dtable.Columns.Add (new DataColumn ("population",typeof (int)));
	dtable.Columns.Add (new DataColumn ("date_mod",typeof (string)));

	return dtable;
}

// ----------------------------------------------------------------
public static void row_add_proc (ref DataTable dtable,
	string id_in,string name_in,int population_in,string date_mod_in)
{
	DataRow new_row = dtable.NewRow ();

	new_row["id"] = id_in;
	new_row["name"] = name_in;
	new_row["population"] = population_in;
	new_row["date_mod"] = date_mod_in;

	dtable.Rows.Add (new_row);
}

// ----------------------------------------------------------------
public static DataTable file_read_proc (String file_in)
{
	DataTable dtable = table_manipulate.table_prepare_proc ();

	StreamReader sr = new StreamReader (file_in);

	string	buff;

	char [] delimeters = new char [] {',',' ','\t'};

	while ((buff = sr.ReadLine ()) != null)
		{
		string [] cols = buff.Split (delimeters);

		DataRow drow = dtable.NewRow ();
		drow["ID"] = cols[0];
		drow["NAME"] = cols[1];
		drow["POPULATION"] = cols[2];
		drow["DATE_MOD"] = cols[3];

		dtable.Rows.Add (drow);
		}

	sr.Close();

	return	dtable;
}

// ----------------------------------------------------------------
public static void display_proc (DataTable dtable)
{
	string out_str;

	for (int it=0; it< dtable.Rows.Count; it++)
		{
		DataRow dr = dtable.Rows[it];

		out_str = dr["ID"].ToString()
			+ "\t" + dr["NAME"].ToString()
			 + "\t" +  dr["POPULATION"].ToString()
			 + "\t" +  dr["DATE_MOD"].ToString();
		Console.WriteLine (out_str);
		}
}

/* ------------------------------------------------------------------- */
public static void update_proc
		(ref DataTable dtable,string id_a,int population_a)
{
	DateTime dateNow = DateTime.Now;
	string str_date = dateNow.ToString ();

Console.WriteLine ("table_modify_proc " + str_date);

	StringBuilder st_filter
		= new StringBuilder (@"ID = '" + id_a + @"'");


	DataView dv_dtable = new DataView (dtable);

	dv_dtable.RowFilter = st_filter.ToString ();

	if (0 < dv_dtable.Count)
		{
		dv_dtable[0]["POPULATION"] = population_a;
		dv_dtable[0]["DATE_MOD"] = str_date;
		}
	else
		{
		Console.WriteLine ("table_modify_proc " + st_filter);
		Console.WriteLine ("dtable.Rows.Count = " + dtable.Rows.Count);
		Console.WriteLine ("dv_dtable.Count = " + dv_dtable.Count);
		}
}

/* ------------------------------------------------------------------- */
public static DataTable delete_proc (DataTable dtable,string id_aa)
{
Console.WriteLine ("delete_proc *** dtable.Rows.Count = " + dtable.Rows.Count);

	StringBuilder st_filter
		= new StringBuilder (@"ID <> '" + id_aa + @"'");

Console.WriteLine ("delete_proc *** st_filter = " + st_filter);
	DataView dv_dtable = new DataView (dtable);

	dv_dtable.RowFilter = st_filter.ToString ();
Console.WriteLine ("delete_proc *** dddd");
Console.WriteLine ("delete_proc *** dv_dtable.Count = " + dv_dtable.Count);

	return	dv_dtable.ToTable ();
}

/* ------------------------------------------------------------------- */
public static DataTable xml_file_read_proc (string xml_file_name)
{
	DataTable dtable = new DataTable ();
	DataSet dst = new DataSet ();

	try
		{
		dst.ReadXml (xml_file_name);
		dtable = dst.Tables["cities"];
		}
	catch	(Exception exp)
		{
		Console.Error.WriteLine ("*** error *** " + exp);
		Environment.Exit (1);
		}

	return	dtable;
}


// ----------------------------------------------------------------
public static DataTable xmlstr_to_table_proc (string str_xml)
{
	StringReader sr = new StringReader (str_xml);

	DataSet dst = new DataSet ();
	DataTable dtable = new DataTable ();

	try
		{
		dst.ReadXml (sr);
		dtable = dst.Tables["cities"];
		}
	catch	(Exception exp)
		{
		Console.Error.WriteLine
			("***  *** error ***");
		Console.Error.WriteLine ("*** error *** " + exp);

		Environment.Exit (1);
		}

	return	dtable;
}

// ------------------------------------------------------------------
public static string table_json_str_proc  (DataTable dtable)
{
	string str_out = json_header_out_proc  ();

	for (int it=0; it< dtable.Rows.Count; it++)
		{
		DataRow dr = dtable.Rows[it];
		string []str_unit = new string[4];
		str_unit[0] = dr["ID"].ToString();
		str_unit[1] = dr["NAME"].ToString();
		str_unit[2] = dr["POPULATION"].ToString();
		str_unit[3] = dr["DATE_MOD"].ToString();

		str_out += unit_out_proc  (str_unit);

		if (it == (dtable.Rows.Count -1))
			{
			str_out += json_tail_out_proc  ();
			}
		else
			{
			str_out += ",";
			}
		}

	return str_out;
}

// ----------------------------------------------------------------
static string json_header_out_proc  ()
{
	string str_head = "{";

	return (str_head);
}

// ---------------------------------------------------------------------
static string json_tail_out_proc  ()
{
	String str_tail = "}";

	return (str_tail);
}

// ---------------------------------------------------------------------
public static string unit_out_proc  (String []str_unit)
{
	StringBuilder stb = new StringBuilder ("\"" + str_unit[0] + "\": {");

	stb.Append ("\"name\":\"" + str_unit[1]);
	stb.Append ("\",\"population\":" + str_unit[2]);
	stb.Append (",\"date_mod\":\"" + str_unit[3] + "\"}");

	return stb.ToString ();

}

// ----------------------------------------------------------------
public static void write_string_proc (string file_out,string out_str)
{
	StreamWriter fp_out = new StreamWriter (file_out);
	fp_out.Write (out_str);
        fp_out.Close ();
}

// ----------------------------------------------------------------
public static void file_write_proc (DataTable dtable,String file_out)
{
	StreamWriter fp_out = new StreamWriter (file_out);

	for (int it=0; it< dtable.Rows.Count; it++)
		{
		DataRow dr = dtable.Rows[it];

		String out_str = dr["ID"].ToString()
				+ "\t" + dr["NAME"].ToString()
				+ "\t" +  dr["POPULATION"].ToString()
				+ "\t" +  dr["DATE_MOD"].ToString();
		fp_out.WriteLine (out_str);	
		}

	fp_out.Close ();
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
