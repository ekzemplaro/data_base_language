// -------------------------------------------------------------------
//
//	tcbn_read.groovy
//
//					May/26/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB
import	java.util.List

// import tcbn_manipulate

// -------------------------------------------------------------------
class tcbn_read
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
	ff.tcbn_to_dict_proc(bdb)
	def dict_aa = ff.tcbn_to_dict_proc(bdb)
	def gg = new text_manipulate ()
	gg.dict_display_proc (dict_aa)

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
