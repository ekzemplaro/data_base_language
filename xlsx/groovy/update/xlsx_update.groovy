// ----------------------------------------------------------------
/*
	xlsx_update.groovy
					Aug/08/2017

*/
// ----------------------------------------------------------------
import	java.util.HashMap 

// ----------------------------------------------------------------
class xlsx_update
{
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def xlsx_file = args[0]
	def key=args[1]
	def population_in=args[2]
	println (key + "\t" +  population_in)


	def ff = new xlsx_manipulate ()

	def dict_aa = ff.xlsx_read_proc (xlsx_file)

	def gg = new text_manipulate ()

	gg.dict_update_proc (dict_aa,key,population_in)

	ff.xlsx_write_proc (xlsx_file,dict_aa) 

	println ("*** 終了 ***")  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
