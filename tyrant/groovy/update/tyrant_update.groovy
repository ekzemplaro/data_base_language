// --------------------------------------------------------------
//	read/tyrant_update.groovy
//
//					Feb/04/2015
// --------------------------------------------------------------
import	mcached_manipulate 

// --------------------------------------------------------------
public class tyrant_update
{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	def	key = args[0]
	def	population = Integer.parseInt (args[1])
	print ("\tid = " + key)
	println ("\tpopulation = " + population)

	final String server = "host_ubuntu1"
	final int port = 1978
	print (server + '\t')
	println (port)

	mcached_manipulate.mcached_update_proc (server,port,key,population)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
