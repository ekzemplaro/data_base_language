// -------------------------------------------------------------------
//
//	java/delete/tcbn_delete.java
//
//					Jun/16/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB;

// -------------------------------------------------------------------
public class tcbn_delete
{
// -------------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

	BDB bdb = new BDB();

	String file_in = "/var/tmp/tokyo_cabinet/cities.tcb";

	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		int ecode = bdb.ecode();
		System.err.println("open error: " + bdb.errmsg(ecode));
		}

	tcbn_manipulate.delete_proc (bdb,id);

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
