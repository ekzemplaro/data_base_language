// -----------------------------------------------------------------
/*
	pdf_create.groovy

				Feb/14/2014

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
import	java.util.HashMap
import	java.util.Set
// -----------------------------------------------------------------
class	pdf_create
{

// -----------------------------------------------------------------
static FileOutputStream pdf_prepare (String pdf_file)
{
	FileOutputStream file_out_st = null

	try
		{
		file_out_st = new FileOutputStream (pdf_file, false)
		}
	catch (FileNotFoundException ee)
		{
		ee.printStackTrace ()
		}

	return	file_out_st
}

// -----------------------------------------------------------------
static void main (args)
{
	println  ("*** 開始 ***")

	def pdf_file = args[0]

	def writer = null
	def cb = null

	def doc_aa = new Document (PageSize.A4,30,30,30,30)

	def file_out_st = pdf_prepare (pdf_file)

	try
		{
		writer = PdfWriter.getInstance (doc_aa, file_out_st)
		}
	catch (DocumentException ee)
		{
		ee.printStackTrace ()
		}

	doc_aa.open ()

	cb = writer.getDirectContent ()


/* ----------- */
		
	def dict_aa = data_prepare_proc ()

	draw_string_size_proc (cb,18,"*** check ***",30,420)

	def set_aaa = dict_aa.keySet ()

	int pos = 700
	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa
		def dict_unit = dict_aa.get (key_aa)
		String name = dict_unit.get ("name")
		String str_population = dict_unit.get ("population")
		int population = Integer.parseInt (str_population)
		String date_mod = dict_unit.get ("date_mod")
		record_out_proc (cb,pos,key,name,population,date_mod)
		pos -= 20
		}

	draw_string_size_proc (cb,18,"*** Jun/07/2011 ***",30,350)
	draw_string_size_proc (cb,18,"*** 終了 ***",30,300)

/* ----------- */
	doc_aa.close()

	try
		{
		file_out_st.close()
		}
	catch (IOException ee)
		{
		ee.printStackTrace ()
		}

	println  ("*** 終了 ***")
}

/* ----------------------------------------------------------------- */
static data_prepare_proc ()
{
	def dict_aa = new HashMap ()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t2531","大津",51276,"1999-9-12")

	dict_aa = ff.dict_append_proc (dict_aa,"t2532","草津",49172,"1999-4-23")

	dict_aa = ff.dict_append_proc (dict_aa,"t2533","守山",92153,"1999-5-24")

	dict_aa = ff.dict_append_proc (dict_aa,"t2534","栗東",86124,"1999-3-14")

	dict_aa = ff.dict_append_proc (dict_aa,"t2535","野洲",72531,"1999-8-11")

	dict_aa = ff.dict_append_proc (dict_aa,"t2536","甲賀",28579,"1999-7-28")

	dict_aa = ff.dict_append_proc (dict_aa,"t2537","湖南",39457,"1999-6-19")

	dict_aa = ff.dict_append_proc (dict_aa,"t2538","近江八幡",47362,"1999-11-15")

	dict_aa = ff.dict_append_proc (dict_aa,"t2539","彦根",87245,"1999-10-24")

	return	dict_aa
}
/* ----------------------------------------------------------------- */
static void record_out_proc (cb,ypos,id,name,population,date_mod)
{
	draw_string_size_proc (cb,18,id,50,ypos)
	draw_string_size_proc (cb,18,name,100,ypos)
	draw_string_size_proc (cb,18,Integer.toString (population),200,ypos)
	draw_string_size_proc (cb,18,date_mod,280,ypos)
}

/* ----------------------------------------------------------------- */
static void draw_string_size_proc (cb,font_size,out_string,xx0,yy0)
{
	try
	{
	BaseFont baseFont = BaseFont.createFont(
		"HeiseiKakuGo-W5",
		"UniJIS-UCS2-H",
		BaseFont.NOT_EMBEDDED)
		cb.setFontAndSize (baseFont,font_size)

	cb.beginText ()
	cb.setTextMatrix (1f,0f,0f,1f,xx0,yy0)
	cb.showText (out_string)
	cb.endText ()
	}
	catch  (Exception ee)
		{
		ee.printStackTrace ()
		}
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
