// ------------------------------------------------------------------
//	hgdb_create.groovy
//
//					Feb/01/2012
// ------------------------------------------------------------------
import	java.util.HashMap
import	text_manipulate
import	hgdb_manipulate

// ------------------------------------------------------------------
class hgdb_create
{

// ------------------------------------------------------------------
static void main(args)
{
	println ("*** 開始 ***")

	def databaseLocation = args[0]

	def dict_aa = data_prepare_proc ()

	hgdb_manipulate.dict_to_hgdb_proc (dict_aa,databaseLocation)

	println ("*** 終了 ***")
}

// ------------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4471","大分",59478,"1999-7-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4472","別府",28674,"1999-2-16")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4473","中津",79235,"1999-11-9")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4474","日田",54756,"1999-5-2")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4475","佐伯",23471,"1999-9-9")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4476","臼杵",18193,"1999-6-30")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4477","津久見",24578,"1999-4-22")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4478","竹田",17632,"1999-3-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4479","豊後高田",83715,"1999-10-2")

	return	dict_aa
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
