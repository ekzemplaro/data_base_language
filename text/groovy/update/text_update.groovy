// -------------------------------------------------------------------
//	text_update.groovy
//
//					Sep/05/2016
//
// -------------------------------------------------------------------
class text_update
{

// -------------------------------------------------------------------
static void main (args)
{
	System.err.println ("*** 開始 ***")

	def file_in=args[0]
	def id_in=args[1]
	def population_in=args[2]
	println (id_in + "\t" +  population_in)

	def ff = new text_manipulate ()

	def dict_aa = ff.text_read_proc (file_in)

	def dict_bb = ff.dict_update_proc (dict_aa,id_in,population_in)

	ff.text_write_proc (file_in,dict_bb)

	System.err.println ("*** 終了 ***")
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------

