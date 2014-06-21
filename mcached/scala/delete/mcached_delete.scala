// ----------------------------------------------------------------
/*
	mcached_delete.scala

					May/29/2012

*/
// ----------------------------------------------------------------
import java.net.Socket
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.OutputStream;

// ----------------------------------------------------------------
object	mcached_delete
{
// ----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val key_in = args(0)

	println (key_in)

	val server = "localhost"
	val port = 11211
	print (server + '\t')
	println (port)

/*
	var ss = new Socket(server, servPort)
	var input = ss.getInputStream ()
	var rr = new InputStreamReader (input)
	var output = ss.getOutputStream ()
*/
	mcached_manipulate.delete_record_proc (key_in,server,port)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
