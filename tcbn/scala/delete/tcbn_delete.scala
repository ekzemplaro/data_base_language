// -------------------------------------------------------------------
//
//	delete/tcbn_delete.scala
//
//					Jun/17/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB

// -------------------------------------------------------------------
object tcbn_delete
{
// -------------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val id_in = args(0)

	println ("\tid_in = " + id_in)

	val bdb = new BDB()

	val file_in = "/var/tmp/tokyo_cabinet/cities.tcb"

	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		val ecode = bdb.ecode()
//		println("open error: " + bdb.errmsg(ecode))
		println("open error: ")
		}

	tcbn_manipulate.delete_proc (bdb,id_in)

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
