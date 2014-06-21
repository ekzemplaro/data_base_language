// --------------------------------------------------------------
//	create/mcached_create.groovy
//
//					Apr/22/2013
// --------------------------------------------------------------
import groovy.json.*
// --------------------------------------------------------------
public class mcached_create{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	def dict_aa = data_prepare_proc ()

	String server = "localhost"
	int servPort = 11211
	print (server + '\t')
	println (servPort)

	def ss = new Socket(server, servPort);

	ss.withStreams
		{input, output ->
		def rr = new InputStreamReader( input )

		def ff = new mcached_manipulate ()

	dict_aa.each
		{
		key,value ->
		def json = new JsonBuilder()
		json (value)

		def str_json = json.toString ()

//		println (str_json)
		ff.socket_write_proc (key,str_json,rr,output)
		}

	}

	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
static data_prepare_proc ()
{
	println "*** data_prepare_proc ***"

	def dict_aa = new HashMap()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t1731","金沢",94178,"1999-9-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t1732","輪島",38674,"1999-5-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t1733","小松",79235,"1999-10-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1734","七尾",54756,"1999-7-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t1735","珠洲",23471,"1999-3-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1736","加賀",58193,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t1737","羽咋",24578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t1738","かほく",17632,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t1739","白山",83715,"1999-10-2")

	return	dict_aa
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
