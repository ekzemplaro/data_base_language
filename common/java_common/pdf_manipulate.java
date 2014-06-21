// -----------------------------------------------------------------
/*
	pdf_manipulate.java

					Jan/07/2012

*/
// -----------------------------------------------------------------
import	java.io.FileOutputStream;
import	java.io.IOException;
import	java.io.FileNotFoundException;
//
import	com.itextpdf.text.Document;
import	com.itextpdf.text.DocumentException;
import	com.itextpdf.text.PageSize;
//
import	com.itextpdf.text.pdf.BaseFont;
import	com.itextpdf.text.pdf.PdfWriter;
import	com.itextpdf.text.pdf.PdfContentByte;
//
import	java.util.HashMap;
import	java.util.Set;
// -----------------------------------------------------------------
public	class	pdf_manipulate
{

// -----------------------------------------------------------------
public static void dict_to_pdf_proc
	(HashMap <String, HashMap <String,String>> dict_aa,String pdf_file)
{
	PdfWriter writer = null;
	PdfContentByte cb = null;

	Document doc_aa = new Document (PageSize.A4,30,30,30,30);

	FileOutputStream file_out_st = pdf_prepare (pdf_file);

	try
		{
		writer = PdfWriter.getInstance (doc_aa, file_out_st);
		}
	catch (DocumentException ee)
		{
		ee.printStackTrace ();
		}

	doc_aa.open ();

	cb = writer.getDirectContent ();

	Set set_aaa = dict_aa.keySet ();

	int pos = 700;
	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		HashMap <String,String> dict_unit = dict_aa.get (key_aa);
		String name = dict_unit.get ("name");
		String str_population = dict_unit.get ("population");
		int population = Integer.parseInt (str_population);
		String date_mod = dict_unit.get ("date_mod");
		record_out_proc (cb,pos,key,name,population,date_mod);
		pos -= 20;
		}


/* ----------- */
	doc_aa.close();

	try
		{
		file_out_st.close();
		}
	catch (IOException ee)
		{
		ee.printStackTrace ();
		}
}

/* ----------------------------------------------------------------- */
private	static FileOutputStream pdf_prepare (String pdf_file)
{
	FileOutputStream file_out_st = null;

	try
		{
		file_out_st = new FileOutputStream (pdf_file, false);
		}
	catch (FileNotFoundException ee)
		{
		ee.printStackTrace ();
		}

	return	file_out_st;
}

// -----------------------------------------------------------------
static void record_out_proc (PdfContentByte cb,int ypos,String id,String name,int population,String date_mod)
{
	draw_string_size_proc (cb,18,id,50,ypos);
	draw_string_size_proc (cb,18,name,180,ypos);
	draw_string_size_proc (cb,18,Integer.toString (population),280,ypos);
	draw_string_size_proc (cb,18,date_mod,450,ypos);
/*
	draw_string_size_proc (cb,18,id,50,ypos);
	draw_string_size_proc (cb,18,name,100,ypos);
	draw_string_size_proc (cb,18,Integer.toString (population),200,ypos);
	draw_string_size_proc (cb,18,date_mod,280,ypos);
*/
}

// -----------------------------------------------------------------
static void draw_string_size_proc
	(PdfContentByte cb,int font_size,
	String out_string,float xx0,float yy0)
{
	try
	{
	BaseFont baseFont = BaseFont.createFont(
		"HeiseiKakuGo-W5",
		"UniJIS-UCS2-H",
		BaseFont.NOT_EMBEDDED);
		cb.setFontAndSize (baseFont,font_size);

	cb.beginText ();
	cb.setTextMatrix (1f,0f,0f,1f,xx0,yy0);
	cb.showText (out_string);
	cb.endText ();
	}
	catch  (Exception ee)
		{
		ee.printStackTrace ();
		}
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
