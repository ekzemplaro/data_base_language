// -------------------------------------------------------------------
//	json_create.groovy
//
//					Mar/12/2013
//
// -------------------------------------------------------------------
import groovy.json.*

// -------------------------------------------------------------------
class json_create
{

// -------------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap()
	def ff = new text_manipulate ()
	dict_aa = ff.dict_append_proc (dict_aa,"t0921","宇都宮",39178,"1999-7-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t0922","小山",48674,"1999-2-26")
	dict_aa = ff.dict_append_proc (dict_aa,"t0923","佐野",79532,"1999-7-5")
	dict_aa = ff.dict_append_proc (dict_aa,"t0924","足利",28456,"1999-5-7")
	dict_aa = ff.dict_append_proc (dict_aa,"t0925","日光",93125,"1999-9-19")
	dict_aa = ff.dict_append_proc (dict_aa,"t0926","下野",58146,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t0927","さくら",26578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t0928","矢板",16598,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t0929","真岡",48735,"1999-10-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t0930","栃木",83526,"1999-7-4")
	dict_aa = ff.dict_append_proc (dict_aa,"t0931","大田原",37915,"1999-3-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t0932","鹿沼",58261,"1999-6-12")
	dict_aa = ff.dict_append_proc (dict_aa,"t0933","那須塩原",52642,"1999-8-18")
	dict_aa = ff.dict_append_proc (dict_aa,"t0934","那須烏山",52637,"1999-9-274")

	return	dict_aa
}

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def file_out = args[0]

	def data_aa = data_prepare_proc ()

	def json = new JsonBuilder()

	json (data_aa)

	def str_json = json.toString ()

	def ff = new File (file_out)
	ff.write (str_json)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
