// ----------------------------------------------------------
/*
	epub_create.groovy

						Dec/02/2014
*/
// ----------------------------------------------------------
import	java.util.HashMap
import	java.util.Set

import java.io.FileOutputStream

import com.adobe.dp.epub.io.OCFContainerWriter
import com.adobe.dp.epub.ncx.TOCEntry
import com.adobe.dp.epub.opf.NCXResource
import com.adobe.dp.epub.opf.OPSResource
import com.adobe.dp.epub.opf.Publication
import com.adobe.dp.epub.ops.Element
import com.adobe.dp.epub.ops.OPSDocument

import	text_manipulate
// ----------------------------------------------------------
class epub_create
{

// ----------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def epub_file = args[0]

	def	dict_aa = data_prepare_proc ()

	def epub = new epub_manipulate ()

	epub.dict_to_epub_proc (epub_file,dict_aa)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------
static HashMap <String, HashMap <String,String>> data_prepare_proc ()
{
	def dict_aa = new HashMap ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1931","甲府",51376,"1999-2-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1932","富士吉田",49142,"1999-4-23")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1933","都留",62753,"1999-5-24")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1934","山梨",89124,"1999-9-14")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1935","大月",72531,"1999-8-12")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1936","韮崎",28519,"1999-7-28")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1937","南アルプス",39457,"1999-6-19")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1938","北杜",57862,"1999-11-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1939","甲斐",31972,"1999-10-24")

	return	dict_aa
}

// ----------------------------------------------------------
}
// ----------------------------------------------------------
