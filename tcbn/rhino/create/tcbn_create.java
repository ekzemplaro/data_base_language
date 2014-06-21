// -------------------------------------------------------------------
//
//	java/create/tcbn_create.java
//
//						Jan/17/2011
// -------------------------------------------------------------------
import tokyocabinet.BDB;

// -------------------------------------------------------------------
public class tcbn_create
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

	tcbn_manipulate.insert_proc (bdb,831,"水戸",71235,"2008-8-10");
	tcbn_manipulate.insert_proc (bdb,832,"古河",65147,"2008-9-11");
	tcbn_manipulate.insert_proc (bdb,833,"結城",41200,"2008-10-14");
	tcbn_manipulate.insert_proc (bdb,834,"土浦",93500,"2008-3-24");
	tcbn_manipulate.insert_proc (bdb,835,"牛久",72700,"2008-5-12");
	tcbn_manipulate.insert_proc (bdb,836,"取手",32100,"2008-4-17");
	tcbn_manipulate.insert_proc (bdb,837,"つくば",84201,"2008-1-30");
	tcbn_manipulate.insert_proc (bdb,838,"日立",65901,"2008-2-12");
	tcbn_manipulate.insert_proc (bdb,839,"守谷",95146,"2008-9-24");

	tcbn_manipulate.display_proc (bdb);

	if(!bdb.close())
		{
		int ecode = bdb.ecode();
		System.err.println("close error: " + bdb.errmsg(ecode));
		}

System.out.println ("*** 終了 ***");
}
// -------------------------------------------------------------------

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
