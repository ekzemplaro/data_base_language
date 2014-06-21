// -------------------------------------------------------------------
//
//	create/tcbn_create.scala
//
//						Jun/16/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB

// -------------------------------------------------------------------
object tcbn_create
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

	tcbn_manipulate.insert_proc (bdb,"t0831","水戸",32581,"1998-4-10")
	tcbn_manipulate.insert_proc (bdb,"t0832","古河",65147,"1998-7-11")
	tcbn_manipulate.insert_proc (bdb,"t0833","結城",48256,"1998-10-14")
	tcbn_manipulate.insert_proc (bdb,"t0834","土浦",91543,"1998-3-24")
	tcbn_manipulate.insert_proc (bdb,"t0835","牛久",72739,"1998-5-12")
	tcbn_manipulate.insert_proc (bdb,"t0836","取手",39125,"1998-4-17")
	tcbn_manipulate.insert_proc (bdb,"t0837","つくば",87246,"1998-1-30")
	tcbn_manipulate.insert_proc (bdb,"t0838","日立",65937,"1998-2-12")
	tcbn_manipulate.insert_proc (bdb,"t0839","守谷",14698,"1998-5-24")

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
