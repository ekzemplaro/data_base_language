// -------------------------------------------------------------------
//
//	update/tcbn_update.scala
//
//					Aug/01/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB;

// -------------------------------------------------------------------
object tcbn_update
{
// -------------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	id = args(0)
	val	population = args(1).toInt

	print ("\tid = " + id)
	println ("\tpopulation = " + population)

	val bdb = new BDB()

	val file_in = "/var/tmp/tokyo_cabinet/cities.tcb"

	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		val ecode = bdb.ecode()
//		println("open error: " + bdb.errmsg(ecode))
		println("open error: ")
		}

	tcbn_manipulate.update_proc (bdb,id,population)

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
