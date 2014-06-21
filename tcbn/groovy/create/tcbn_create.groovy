// -------------------------------------------------------------------
//
//	create/tcbn_create.groovy
//
//						Jan/06/2014
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

	ff.insert_proc (bdb,"t0831","水戸",74812,"1999-2-20")
	ff.insert_proc (bdb,"t0832","古河",56147,"1999-7-11")
	ff.insert_proc (bdb,"t0833","結城",91284,"1999-10-14")
	ff.insert_proc (bdb,"t0834","土浦",43571,"1999-3-24")
	ff.insert_proc (bdb,"t0835","牛久",72839,"1999-5-12")
	ff.insert_proc (bdb,"t0836","取手",35126,"1999-4-17")
	ff.insert_proc (bdb,"t0837","つくば",89246,"1999-1-30")
	ff.insert_proc (bdb,"t0838","日立",75932,"1999-8-9")
	ff.insert_proc (bdb,"t0839","守谷",49871,"1999-9-24")

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
