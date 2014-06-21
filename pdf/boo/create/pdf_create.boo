// -----------------------------------------------------------------
/*
	pdf_create.boo

					Feb/14/2014
*/
// -----------------------------------------------------------------
import	System
import	System.IO

import	iTextSharp.text
import	iTextSharp.text.pdf
// -----------------------------------------------------------------
def record_out_proc  \
	(cb as PdfContentByte,baseFont as BaseFont, \
	ypos,key as string,name as string ,population,date_mod as string):
	cb.BeginText ()

	cb.SetFontAndSize (baseFont,18f)

	cb.SetTextMatrix (1f,0f,0f,1f,20f,ypos)
	cb.ShowText (key)

	cb.SetTextMatrix (1f,0f,0f,1f,150f,ypos)
	cb.ShowText (name)

	cb.SetTextMatrix (1f,0f,0f,1f,300f,ypos)
	cb.ShowText (population.ToString ())

	cb.SetTextMatrix (1f,0f,0f,1f,400f,ypos)
	cb.ShowText (date_mod)

	cb.EndText ()

// -----------------------------------------------------------------
print "*** 開始 ***"

pdf_file= argv[0]

BaseFont.AddToResourceSearch("iTextAsian.dll")

doc_aa = Document (PageSize.A4,30,30,30,30)

writer = PdfWriter.GetInstance \
		(doc_aa,FileStream (pdf_file, FileMode.Create))
doc_aa.Open ()

baseFont = BaseFont.CreateFont \
		("HeiseiKakuGo-W5", "UniJIS-UCS2-H", BaseFont.NOT_EMBEDDED)

cb = writer.DirectContent

record_out_proc (cb,baseFont,700,"t2531","大津",81792,"1968-9-14")
record_out_proc (cb,baseFont,680,"t2532","草津",23481,"1968-8-28")
record_out_proc (cb,baseFont,660,"t2533","守山",59367,"1968-2-9")
record_out_proc (cb,baseFont,640,"t2534","栗東",42673,"1968-7-15")
record_out_proc (cb,baseFont,620,"t2535","野洲",67192,"1968-9-11")
record_out_proc (cb,baseFont,600,"t2536","甲賀",28591,"1968-3-17")
record_out_proc (cb,baseFont,580,"t2537","湖南",81476,"1968-8-21")
record_out_proc (cb,baseFont,560,"t2538","近江八幡",16532,"1968-10-30")
record_out_proc (cb,baseFont,540,"t2539","彦根",52718,"1968-11-24")

doc_aa.Close ()

print "*** 終了 ***"


// -----------------------------------------------------------------

// -----------------------------------------------------------------
