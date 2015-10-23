// -------------------------------------------------------------------
//
//	tcbn_read.java
//
//					Jan/17/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB;
import	java.util.List;

// -------------------------------------------------------------------
public class tcbn_read
{
// -------------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	BDB bdb = new BDB();

	String file_in = "/var/tmp/tokyo_cabinet/cities.tcb";

	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		int ecode = bdb.ecode();
		System.err.println("open error: " + bdb.errmsg(ecode));
		}

	tcbn_manipulate.display_proc (bdb);

	if(!bdb.close())
		{
		int ecode = bdb.ecode();
		System.err.println("close error: " + bdb.errmsg(ecode));
		}

	System.out.println ("*** 終了 ***");
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
