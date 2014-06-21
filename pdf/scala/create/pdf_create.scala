// -----------------------------------------------------------------
/*
	pdf_create.scala

				Jan/21/2011

*/
// -----------------------------------------------------------------
import	java.io.FileOutputStream
import	java.io.IOException
import	java.io.FileNotFoundException
//
import	com.itextpdf.text.Document
import	com.itextpdf.text.DocumentException
import	com.itextpdf.text.PageSize
//
import	com.itextpdf.text.pdf.BaseFont
import	com.itextpdf.text.pdf.PdfWriter
import	com.itextpdf.text.pdf.PdfContentByte
//
import	com.itextpdf.text.pdf.BaseFont._
import	com.itextpdf.text.pdf.FontMapper._

// -----------------------------------------------------------------
object pdf_create
{

// -----------------------------------------------------------------
def pdf_prepare (pdf_file:String) : FileOutputStream =
{
//	val file_out_st = null
//	try
//	{
	val file_out_st = new FileOutputStream (pdf_file, false)
//	}
//	finally
//	{
//print ("*** check ***")
//	}

	return	file_out_st
}

// -----------------------------------------------------------------
def main( args: Array[String])
{
	println  ("*** 開始 ***")

	val pdf_file = args(0)

//	val writer = null
//	val cb = null

	val doc_aa = new Document (PageSize.A4,30,30,30,30)

	val file_out_st = pdf_prepare (pdf_file)

//	try
//	{
	val writer = PdfWriter.getInstance (doc_aa, file_out_st)
//	}
//	finally
//	{
// print ("*** check ***")
//	}

	doc_aa.open ()

	val cb = writer.getDirectContent ()


/* ----------- */

//	draw_string_size_proc (cb,18,"*** check ***",30,420)

//	record_out_proc (cb,700,2531,"大津",24539,"1998-4-12")
//	record_out_proc (cb,680,2532,"草津",74531,"1998-8-21")
//	record_out_proc (cb,660,2533,"守山",52582,"1998-2-26")

	record_out_proc (cb,700,"t2531","Ootsu",24539,"1998-4-12")
	record_out_proc (cb,680,"t2532","Kusatsu",74531,"1998-8-21")
	record_out_proc (cb,660,"t2533","Moriyama",51782,"1998-2-26")
	record_out_proc (cb,640,"t2534","栗東",42573,"1998-7-8")
	record_out_proc (cb,620,"t2535","野洲",68194,"1998-9-11")
	record_out_proc (cb,600,"t2536","甲賀",29341,"1998-3-15")
	record_out_proc (cb,580,"t2537","湖南",87594,"1998-8-21")
	record_out_proc (cb,560,"t2538","近江八幡",16592,"1998-5-3")
	record_out_proc (cb,540,"t2539","彦根",72695,"1998-7-17")


//	draw_string_size_proc (cb,18,"*** ddddd ***",30,200)

/* ----------- */
	doc_aa.close()

	try
	{
	file_out_st.close()
	}
	finally
	{
print ("*** check ***")
	}

	println  ("*** 終了 ***")
}

// -----------------------------------------------------------------
def record_out_proc (cb:PdfContentByte,ypos:Int,id:String,name:String,population:Int,date_mod:String)
{
	draw_string_size_proc (cb,18,id,50,ypos)
	draw_string_size_proc (cb,18,name,100,ypos)
	draw_string_size_proc (cb,18,Integer.toString (population),200,ypos)
	draw_string_size_proc (cb,18,date_mod,280,ypos)
}


// -----------------------------------------------------------------
def draw_string_size_proc
	(cb:PdfContentByte,font_size:Int,
	out_string:String,xx0:Float,yy0:Float)
{

try
{
	val folder_font = "/media/OS/WINDOWS/Fonts/"

	val  ms_gothic = "msgothic.ttc,0"
	val str_font = folder_font + ms_gothic
	val baseFont = BaseFont.createFont
			(str_font,BaseFont.IDENTITY_H, BaseFont.EMBEDDED)

	cb.setFontAndSize (baseFont,font_size)

cb.beginText ()
cb.setTextMatrix (1f,0f,0f,1f,xx0,yy0)
cb.showText (out_string)

cb.endText ()

}
finally{
print ("*** check ***")
}
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
