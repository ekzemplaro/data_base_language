// -------------------------------------------------------------------
//	csv_delete.groovy
//
//					Aug/05/2014
//
// -------------------------------------------------------------------
class csv_delete
{

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def file_in=args[0]
	def id_in=args[1]
	println (id_in)

	def ff = new text_manipulate ()

	def dict_aa = ff.csv_read_proc (file_in)

	def dict_bb = ff.dict_delete_proc (dict_aa,id_in)

	ff.csv_write_proc (file_in,dict_bb)

	println ("*** 終了 ***")
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
