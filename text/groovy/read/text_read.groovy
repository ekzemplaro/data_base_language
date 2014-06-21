// -------------------------------------------------------------------
//	text_read.groovy
//
//					Feb/02/2010
//
// -------------------------------------------------------------------
class text_read
{

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")
	def file_in=args[0]

//	new File (file_in).eachLine {line -> println (line)}

	def ff = new text_manipulate ()

	def dict_aa = ff.text_read_proc (file_in)


	println ("*** pppp ***")

	ff.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}
// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
