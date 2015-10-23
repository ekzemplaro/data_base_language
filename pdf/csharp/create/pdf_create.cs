// -----------------------------------------------------------------
/*
	pdf_create.cs

					Feb/14/2014
*/
// -----------------------------------------------------------------
using	System;
using	System.IO;

using	iTextSharp.text;
using	iTextSharp.text.pdf;
// -----------------------------------------------------------------
public	class	pdf_create
{
// -----------------------------------------------------------------
public	static void Main (String [] args)
{
	Console.WriteLine  ("*** 開始 ***");

	String pdf_file= args[0];

	BaseFont.AddToResourceSearch("iTextAsian.dll");

	Document doc_aa = new Document (PageSize.A4,30,30,30,30);

	try
	{
	PdfWriter writer = PdfWriter.GetInstance
		(doc_aa, new FileStream (pdf_file, FileMode.Create));
	doc_aa.Open ();

	BaseFont baseFont = BaseFont.CreateFont
		("HeiseiKakuGo-W5", "UniJIS-UCS2-H", BaseFont.NOT_EMBEDDED);

	PdfContentByte cb = writer.DirectContent;

	record_out_proc (cb,baseFont,700,"t2531","大津",49817,"2009-6-25");
	record_out_proc (cb,baseFont,680,"t2532","草津",76234,"2009-8-12");
	record_out_proc (cb,baseFont,660,"t2533","守山",69385,"2009-2-26");
	record_out_proc (cb,baseFont,640,"t2534","栗東",42673,"2009-7-8");
	record_out_proc (cb,baseFont,620,"t2535","野洲",67192,"2009-9-11");
	record_out_proc (cb,baseFont,600,"t2536","甲賀",21598,"2009-3-15");
	record_out_proc (cb,baseFont,580,"t2537","湖南",81476,"2009-8-21");
	record_out_proc (cb,baseFont,560,"t2538","近江八幡",16532,"2009-10-30");
	record_out_proc (cb,baseFont,540,"t2539","彦根",52798,"2009-11-24");
	}
	catch (Exception exp)
	{
	Console.Error.WriteLine (exp.Message);
	}
	finally
	{
	doc_aa.Close ();
	}

	Console.WriteLine ("*** 終了 ***");
}


// -----------------------------------------------------------------
static void record_out_proc 
	(PdfContentByte cb,BaseFont baseFont,
	int ypos,String key,String name,
	int population,String date_mod)
{
	cb.BeginText ();

	cb.SetFontAndSize (baseFont,18f);

	cb.SetTextMatrix (1f,0f,0f,1f,20f,ypos);
	cb.ShowText (key);

	cb.SetTextMatrix (1f,0f,0f,1f,150f,ypos);
	cb.ShowText (name);

	cb.SetTextMatrix (1f,0f,0f,1f,300f,ypos);
	cb.ShowText (population.ToString ());

	cb.SetTextMatrix (1f,0f,0f,1f,400f,ypos);
	cb.ShowText (date_mod);

	cb.EndText ();
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
