// -------------------------------------------------------------------
//
//	tcbn_read.scala
//
//					Jul/31/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB
import	java.util.List

// -------------------------------------------------------------------
object tcbn_read
{
// -------------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val bdb = new BDB()

	val file_in = "/var/tmp/tokyo_cabinet/cities.tcb"

	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		val ecode = bdb.ecode()
//		println("open error: " + bdb.errmsg(ecode))
		println("open error: ")
		}

	tcbn_manipulate.display_proc (bdb)

	if(!bdb.close())
		{
		val ecode = bdb.ecode()
//		println("close error: " + bdb.errmsg(ecode))
		println("close error: ")
		}

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
