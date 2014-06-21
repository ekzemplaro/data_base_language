// -------------------------------------------------------------------
//
//	update/tcbn_update.groovy
//
//					Jun/16/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB;

// -------------------------------------------------------------------
class tcbn_update
{
// -------------------------------------------------------------------
static void main(String[] args)
{
	println ("*** 開始 ***")

	def id_in=args[0]
	def population_in=args[1]
	println (id_in + "\t" +  population_in)

	def bdb = new BDB()

	def file_in = "/var/tmp/tokyo_cabinet/cities.tcb"

	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		def ecode = bdb.ecode()
//		println("open error: " + bdb.errmsg(ecode))
		println("open error: ")
		}

	def ff = new tcbn_manipulate ()
	ff.update_proc (bdb,id_in,population_in)

	if(!bdb.close())
		{
		def ecode = bdb.ecode()
//		println("close error: " + bdb.errmsg(ecode))
		println("close error: ")
		}

	println ("*** 終了 ***")
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
