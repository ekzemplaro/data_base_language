// -------------------------------------------------------------------
//	csv_update.groovy
//
//					Feb/01/2011
//
// -------------------------------------------------------------------
class csv_update
{

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def file_in=args[0]
	def id_in=args[1]
	def population_in=args[2]
	println (id_in + "\t" +  population_in)

	def ff = new text_manipulate ()

	def dict_aa = ff.csv_read_proc (file_in)

	def dict_bb = ff.dict_update_proc (dict_aa,id_in,population_in)

	ff.dict_display_proc (dict_bb)

	ff.csv_write_proc (file_in,dict_bb)

	println ("*** 終了 ***")
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------

