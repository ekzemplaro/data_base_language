// -------------------------------------------------------------------
//	exist_create.groovy
//
//					Jul/23/2011
//
// -------------------------------------------------------------------
import xml_manipulate
import net_manipulate

class exist_create
{

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def dict_aa = data_prepare_proc ()

	def ff = new xml_manipulate ()
	def str_out = ff.dict_to_xml_proc (dict_aa)

	def collections = 'cities'
	def xml_file = 'cities.xml'
	def uri= "http://admin:tiger@localhost:8086/exist/rest/db/" + 
		collections + "/" + xml_file

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

	dict_aa = ff.dict_append_proc (dict_aa,"t4251","長崎",47592,"1999-3-4")
	dict_aa = ff.dict_append_proc (dict_aa,"t4252","佐世保",91674,"1999-2-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t4253","島原",79132,"1999-7-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t4254","大村",56291,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t4255","諫早",23415,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t4256","五島",18296,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t4257","平戸",24578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t4258","雲仙",47289,"1999-10-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t4259","松浦",23715,"1999-12-5")

	return	dict_aa
}
// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
