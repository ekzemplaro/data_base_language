// -------------------------------------------------------------------
//
//	create/tcbn_create.groovy
//
//						Jun/16/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB

// -------------------------------------------------------------------
class tcbn_create
{
// -------------------------------------------------------------------
static void main(String[] args)
{
	println ("*** 開始 ***")

	def bdb = new BDB()

	def file_in = "/var/tmp/tokyo_cabinet/cities.tcb"

	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		def ecode = bdb.ecode()
//		println("open error: " + bdb.errmsg(ecode))
		println("open error: ")
		}

	def ff = new tcbn_manipulate ()

	ff.insert_proc (bdb,"t0831","水戸",21812,"1999-2-20")
	ff.insert_proc (bdb,"t0832","古河",56147,"1999-7-11")
	ff.insert_proc (bdb,"t0833","結城",41284,"1999-10-14")
	ff.insert_proc (bdb,"t0834","土浦",93571,"1999-3-24")
	ff.insert_proc (bdb,"t0835","牛久",72739,"1999-5-12")
	ff.insert_proc (bdb,"t0836","取手",32125,"1999-4-17")
	ff.insert_proc (bdb,"t0837","つくば",84246,"1999-1-30")
	ff.insert_proc (bdb,"t0838","日立",65937,"1999-8-9")
	ff.insert_proc (bdb,"t0839","守谷",69876,"1999-9-24")

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
