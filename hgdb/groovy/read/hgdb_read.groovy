// -------------------------------------------------------------- 
//
//	hgdb_read.groovy
//
//						Feb/01/2012
//
// --------------------------------------------------------------
import	java.util.HashMap
import	text_manipulate
import	hgdb_manipulate
// --------------------------------------------------------------
class hgdb_read
{

// --------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def databaseLocation = args[0]

	def dict_aa = hgdb_manipulate.hgdb_to_dict_proc (databaseLocation)

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
