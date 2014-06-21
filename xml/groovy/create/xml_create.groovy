// -------------------------------------------------------------------
//	xml_create.groovy
//
//					Oct/24/2011
//
// -------------------------------------------------------------------
class xml_create
{

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def file_out = args[0]

	def dict_aa = data_prepare_proc ()

	def ff = new xml_manipulate ()
	def out_str = ff.dict_to_xml_proc (dict_aa)

	def fp = new File (file_out)
	fp.write (out_str)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
static data_prepare_proc ()
{
	println "*** data_prepare_proc ***"

	def ff = new text_manipulate ()

	def dict_aa = new HashMap()
	dict_aa = ff.dict_append_proc (dict_aa,"t2261","静岡",47518,"1999-3-4")
	dict_aa = ff.dict_append_proc (dict_aa,"t2262","浜松",48674,"1999-12-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t2263","沼津",79262,"1999-8-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t2264","三島",54756,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t2265","富士",23165,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t2266","熱海",18196,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t2267","富士宮",24578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t2268","藤枝",17683,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t2269","御殿場",43715,"1999-10-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t2270","島田",71528,"1999-5-14")

	return	dict_aa
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
