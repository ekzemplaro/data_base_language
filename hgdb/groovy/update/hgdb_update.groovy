// -------------------------------------------------------------- 
//
//	hgdb_update.groovy
//
//						Feb/01/2012
//
// --------------------------------------------------------------
import	java.util.HashMap
import	text_manipulate
import	hgdb_manipulate

// --------------------------------------------------------------
class hgdb_update
{

// --------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def databaseLocation = args[0]

	def key = args[1]
	def population = Integer.parseInt (args[2])
	System.out.print ("\tkey = " + key)
	System.out.println ("\tpopulation = " + population)

	def dict_aa = hgdb_manipulate.hgdb_to_dict_proc (databaseLocation)

	text_manipulate.dict_update_proc (dict_aa,key,population)

	text_manipulate.dict_display_proc (dict_aa)

	hgdb_manipulate.dict_to_hgdb_proc (dict_aa,databaseLocation)

	println ("*** 終了 ***")
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
