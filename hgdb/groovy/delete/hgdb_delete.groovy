// -------------------------------------------------------------- 
//
//	hgdb_delete.groovy
//
//						Feb/01/2012
//
// --------------------------------------------------------------
import	java.util.HashMap
import	text_manipulate
import	hgdb_manipulate

// --------------------------------------------------------------
class hgdb_delete
{

// --------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def databaseLocation = args[0]

	def key_in = args[1]
	System.out.println ("\tkey_in = " + key_in)

	def dict_aa = hgdb_manipulate.hgdb_to_dict_proc (databaseLocation)

	if (dict_aa.containsKey (key_in))
		{
		text_manipulate.dict_delete_proc (dict_aa,key_in)

		text_manipulate.dict_display_proc (dict_aa)

		hgdb_manipulate.dict_to_hgdb_proc (dict_aa,databaseLocation)
		}

	println ("*** 終了 ***")
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
