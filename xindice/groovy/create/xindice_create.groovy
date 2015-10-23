// -------------------------------------------------------------------
//	xindice_create.groovy
//
//					Jul/23/2011
//
// -------------------------------------------------------------------
import xml_manipulate
import net_manipulate

class xindice_create
{

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def dict_aa = data_prepare_proc ()

	def ff = new xml_manipulate ()
	def str_out = ff.dict_to_xml_proc (dict_aa)

	def uri= "http://cdbd026:8888/xindice/db/cities/cities"

	def type = "text/xml"

	net_manipulate.rest_put_proc (uri,str_out,type)

	
	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
static data_prepare_proc ()
{
	println "*** data_prepare_proc ***"

	def dict_aa = new HashMap()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t0271","青森",49291,"1999-7-12")
	dict_aa = ff.dict_append_proc (dict_aa,"t0272","弘前",98674,"1999-6-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t0273","八戸",79232,"1999-2-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t0274","三沢",56291,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t0275","黒石",23475,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t0276","むつ",18196,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t0277","五所川原",24578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t0278","十和田",47684,"1999-10-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t0279","平川",23715,"1999-12-5")

	return	dict_aa
}
// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
