// -----------------------------------------------------------------------
/*
	file_io.scala

					Sep/18/2014
*/
// -----------------------------------------------------------------------
import scala.io.Source
// -----------------------------------------------------------------------
object file_io
{

// -----------------------------------------------------------------------
def file_to_str_proc (file_in:String):String =
{
	val source = Source.fromFile (file_in)

	var str_in = source.mkString
	source.close ()

	return	str_in
}

// ----------------------------------------------------------------
def file_write_proc (file_out:String,str_out:String)
{
	val out = new java.io.FileWriter (file_out)
	out.write (str_out)
	out.close

}

// -----------------------------------------------------------------------
def url_to_str_proc (url_in:String):String =
{
	val source = Source.fromURL (url_in)

	var str_in = ""
	for( line <- source.getLines )
		{
		str_in += line
		}

	return	str_in
}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
