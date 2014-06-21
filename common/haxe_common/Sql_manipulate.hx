// -------------------------------------------------------------------
//	Sql_manipulate.hx
//
//					Feb/24/2014
// -------------------------------------------------------------------
class Sql_manipulate
{
// -------------------------------------------------------------------
public static function sql_display_proc (cnx: sys.db.Connection) : Void
{
	var rset = cnx.request("SELECT * FROM cities");

	Sys.println ("Found "+rset.length+" cities");
	for( row in rset )
		{
		Sys.println (row.id + "\t" +row.name+"\t"+row.population+"\t"+row.date_mod);
		}
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
