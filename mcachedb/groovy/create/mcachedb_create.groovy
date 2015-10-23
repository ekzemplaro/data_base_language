// --------------------------------------------------------------
//	create/mcachedb_create.groovy
//
//					Feb/04/2015
// --------------------------------------------------------------
import mcached_manipulate

// --------------------------------------------------------------
public class mcachedb_create{

// --------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	def dict_aa = data_prepare_proc ()

	final String server = "host_ubuntu1"
	final int port = 21201
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

	dict_aa = ff.dict_append_proc (dict_aa,"t1521","新潟",92837,"1999-2-14")
	dict_aa = ff.dict_append_proc (dict_aa,"t1522","長岡",35429,"1999-8-26")
	dict_aa = ff.dict_append_proc (dict_aa,"t1523","新発田",87561,"1999-9-3")
	dict_aa = ff.dict_append_proc (dict_aa,"t1524","上越",51756,"1999-11-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t1525","糸魚川",23471,"1999-3-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1526","加茂",58193,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t1527","三条",24578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t1528","佐渡",17632,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t1529","柏崎",83715,"1999-10-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t1530","村上",12465,"1999-5-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1531","十日町",65283,"1999-8-11")
	dict_aa = ff.dict_append_proc (dict_aa,"t1532","五泉",73921,"1999-4-23")

	return	dict_aa
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------

