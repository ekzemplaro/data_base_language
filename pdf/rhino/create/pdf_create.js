#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// -----------------------------------------------------------------
/*
	pdf_create.js

				Feb/14/2014

*/
// -----------------------------------------------------------------
importPackage (java.io);
importPackage (java.util);
importPackage (java.lang);
//
importPackage (com.itextpdf.text);
//
importPackage (com.itextpdf.text.pdf);
//
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// -----------------------------------------------------------------
print  ("*** 開始 ***");

var pdf_file = arguments[0];

var writer = null;
var cb = null;

var doc_aa = new Document (PageSize.A4,30,30,30,30);

var file_out_st = pdf_prepare (pdf_file);

writer = PdfWriter.getInstance (doc_aa, file_out_st);


doc_aa.open ();

cb = writer.getDirectContent ()


		
var dict_aa = data_prepare_proc ();

draw_string_size_proc (cb,18,"*** check ***",30,420);


var pos = 700;

for (var key in dict_aa)
	{
	var dict_unit = dict_aa[key];
	var name = dict_unit["name"];
	var str_population = dict_unit["population"];
	var population = Integer.parseInt (str_population);
	var date_mod = dict_unit["date_mod"];
	record_out_proc (cb,pos,key,name,population,date_mod);
	pos -= 20;
	}

draw_string_size_proc (cb,18,"*** Jun/07/2011 ***",30,350);
draw_string_size_proc (cb,18,"*** 終了 ***",30,300);

doc_aa.close();

file_out_st.close();

print  ("*** 終了 ***");

// -----------------------------------------------------------------
function pdf_prepare (pdf_file)
{
	var file_out_st = null;

	file_out_st = new FileOutputStream (pdf_file, false);

	return	file_out_st;
}

// -----------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = dict_append_proc (dict_aa,"t2531","大津",27634,"1951-2-15");

	dict_aa = dict_append_proc (dict_aa,"t2532","草津",14529,"1951-4-23");

	dict_aa = dict_append_proc (dict_aa,"t2533","守山",48153,"1951-5-24");

	dict_aa = dict_append_proc (dict_aa,"t2534","栗東",89524,"1951-9-14");

	dict_aa = dict_append_proc (dict_aa,"t2535","野洲",72631,"1951-8-12");

	dict_aa = dict_append_proc (dict_aa,"t2536","甲賀",28579,"1951-7-28");

	dict_aa = dict_append_proc (dict_aa,"t2537","湖南",39457,"1951-6-19");

	dict_aa = dict_append_proc (dict_aa,"t2538","近江八幡",47362,"1951-11-15");

	dict_aa = dict_append_proc (dict_aa,"t2539","彦根",87245,"1951-10-24");

	return	dict_aa
}
/* ----------------------------------------------------------------- */
function record_out_proc (cb,ypos,id,name,population,date_mod)
{
	draw_string_size_proc (cb,18,id,50,ypos);
	draw_string_size_proc (cb,18,name,100,ypos);
	draw_string_size_proc (cb,18,Integer.toString (population),200,ypos);
	draw_string_size_proc (cb,18,date_mod,280,ypos);
}

/* ----------------------------------------------------------------- */
function draw_string_size_proc (cb,font_size,out_string,xx0,yy0)
{
	var baseFont = BaseFont.createFont(
		"HeiseiKakuGo-W5",
		"UniJIS-UCS2-H",
		BaseFont.NOT_EMBEDDED)
		cb.setFontAndSize (baseFont,font_size);

	cb.beginText ();
	cb.setTextMatrix (1.0,0.0,0.0,1.0,xx0,yy0);
	cb.showText (out_string);
	cb.endText ();
}


// -----------------------------------------------------------------
