// -------------------------------------------------------------------
//
//	java/create/tcbn_create.java
//
//						Jun/16/2011
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

	tcbn_manipulate.insert_proc (bdb,"t0831","水戸",71235,"2008-8-10");
	tcbn_manipulate.insert_proc (bdb,"t0832","古河",65147,"2008-9-11");
	tcbn_manipulate.insert_proc (bdb,"t0833","結城",41268,"2008-10-14");
	tcbn_manipulate.insert_proc (bdb,"t0834","土浦",93591,"2008-3-24");
	tcbn_manipulate.insert_proc (bdb,"t0835","牛久",72746,"2008-5-18");
	tcbn_manipulate.insert_proc (bdb,"t0836","取手",32189,"2008-4-17");
	tcbn_manipulate.insert_proc (bdb,"t0837","つくば",84265,"2008-1-30");
	tcbn_manipulate.insert_proc (bdb,"t0838","日立",65973,"2008-2-12");
	tcbn_manipulate.insert_proc (bdb,"t0839","守谷",95146,"2008-9-24");

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
