// ----------------------------------------------------------------
/*
	table_manipulate.boo

					Jan/30/2014

*/
// ----------------------------------------------------------------
// using	System
//using	System.Data
//using	System.Text
//using	System.IO
//

// ----------------------------------------------------------------
def table_prepare_proc ():
	dtable = DataTable ("cities")

	dtable.Columns.Add (DataColumn ("id",typeof (string)))
	dtable.Columns.Add (DataColumn ("name",typeof (string)))
	dtable.Columns.Add (DataColumn ("population",typeof (int)))
	dtable.Columns.Add (DataColumn ("date_mod",typeof (string)))

	return dtable

// ----------------------------------------------------------------
def row_add_proc (dtable as DataTable,id_in as string,name_in as string, \
	population_in as int,date_mod_in as string):
	new_row = dtable.NewRow ()

	new_row["id"] = id_in
	new_row["name"] = name_in
	new_row["population"] = population_in
	new_row["date_mod"] = date_mod_in

	dtable.Rows.Add (new_row)

// ----------------------------------------------------------------
def table_display_proc (dtable as DataTable):
	for it in  range (dtable.Rows.Count):
		out_str = dtable.Rows[it]["ID"] \
			+ "\t" + dtable.Rows[it]["NAME"] \
			 + "\t" +  dtable.Rows[it]["POPULATION"] \
			 + "\t" +  dtable.Rows[it]["DATE_MOD"]
		Console.WriteLine (out_str)

/* ------------------------------------------------------------------- */
