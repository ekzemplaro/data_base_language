// --------------------------------------------------------------
//	read/mcached_update.groovy
//
//					Feb/04/2015
// --------------------------------------------------------------
import	mcached_manipulate 
// --------------------------------------------------------------
public class mcached_update
{
// --------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	def	key = args[0]
	def	population = Integer.parseInt (args[1])
	print ("\tid = " + key)
	println ("\tpopulation = " + population)

	final String server = "localhost"
	final int port = 11211
	print (server + '\t')
	println (port)

	mcached_manipulate.mcached_update_proc (server,port,key,population)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
