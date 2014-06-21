// -------------------------------------------------------------------
//	csv_create.groovy
//
//					Jul/11/2011
//
// -------------------------------------------------------------------
class csv_create
{

// -------------------------------------------------------------------
static data_prepare_proc ()
{
	println "*** data_prepare_proc ***"

	def dict_aa = new HashMap()
	def ff = new text_manipulate ()
	dict_aa = ff.dict_append_proc (dict_aa,"t1271","千葉",78251,"1999-6-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t1272","勝浦",49674,"1999-2-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t1273","市原",73832,"1999-7-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1274","流山",54256,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t1275","八千代",28175,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1276","我孫子",12136,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t1277","鴨川",27578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t1278","銚子",14698,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t1279","市川",43715,"1999-10-2")

	return	dict_aa
}

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def file_out=args[0]


	def dict_aa = data_prepare_proc ()

	def ff = new text_manipulate ()
	ff.dict_display_proc (dict_aa)

	ff.csv_write_proc (file_out,dict_aa)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
