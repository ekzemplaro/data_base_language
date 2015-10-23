// --------------------------------------------------------------
//	create/tyrant_create.groovy
//
//					Feb/04/2015
// --------------------------------------------------------------
import mcached_manipulate
// --------------------------------------------------------------
public class tyrant_create{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	def dict_aa = data_prepare_proc ()

	final String server = "host_ubuntu1"
	final int port = 1978
	print (server + '\t')
	println (port)

	mcached_manipulate.dict_to_mcached_proc (server,port,dict_aa)

	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
static data_prepare_proc ()
{
	println "*** data_prepare_proc ***"

	def dict_aa = new HashMap()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t4761","那覇",78325,"1999-2-14")
	dict_aa = ff.dict_append_proc (dict_aa,"t4762","宜野湾",67419,"1999-8-6")
	dict_aa = ff.dict_append_proc (dict_aa,"t4763","石垣",23548,"1999-9-19")
	dict_aa = ff.dict_append_proc (dict_aa,"t4764","浦添",75639,"1999-7-21")
	dict_aa = ff.dict_append_proc (dict_aa,"t4765","名護",23471,"1999-3-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t4766","糸満",58193,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t4767","沖縄",24578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t4768","豊見城",17632,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t4769","うるま",23795,"1999-10-2")

	return	dict_aa
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
