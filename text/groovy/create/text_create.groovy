// -------------------------------------------------------------------
//	text_create.groovy
//
//					Sep/05/2016
//
// -------------------------------------------------------------------
import	text_manipulate

// -------------------------------------------------------------------
class text_create
{

// -------------------------------------------------------------------
static void main (args)
{
	System.err.println ("*** 開始 ***")

	def file_out=args[0]

	def dict_aa = data_prepare_proc ()

	def ff = new text_manipulate ()

	ff.text_write_proc (file_out,dict_aa)

	System.err.println ("*** 終了 ***")
}
// -------------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t2381","名古屋",59278,"1999-8-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t2382","豊橋",28174,"1999-2-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t2383","岡崎",79235,"1999-11-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t2384","一宮",54216,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t2385","蒲郡",23479,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t2386","常滑",18493,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t2387","大府",29578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t2388","瀬戸",14632,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t2389","犬山",83725,"1999-10-2")

	return	dict_aa
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
