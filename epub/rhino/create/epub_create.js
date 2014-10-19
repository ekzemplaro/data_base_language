#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------
//
//	epub_create.js
//
//						Sep/17/2014
//
// ----------------------------------------------------------

importPackage (java.io);
importPackage (java.lang);

importPackage (com.adobe.dp.epub.io);
importPackage (com.adobe.dp.epub.ncx);
importPackage (com.adobe.dp.epub.opf);
importPackage (com.adobe.dp.epub.ops);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// ----------------------------------------------------------

print ("*** 開始 ***");

var epub_file = arguments[0];

var dict_aa = data_prepare_proc ();

dict_to_epub_proc (epub_file,dict_aa);

print ("*** 終了 ***");

// ----------------------------------------------------------
function dict_to_epub_proc (epub_file,dict_aa)
{
	var epub = new Publication();

		epub.addDCMetadata("title", "My First EPUB");
		epub.addDCMetadata("creator", System.getProperty("user.name"));
		epub.addDCMetadata("language", "ja");

	var toc = epub.getTOC();
	var rootTOCEntry = toc.getRootTOCEntry();

	var main = epub.createOPSResource("OPS/main.html");
		epub.addToSpine(main);

	var mainDoc = main.getDocument();

	var mainTOCEntry = toc.createTOCEntry("Intro", mainDoc.getRootXRef());
	rootTOCEntry.add(mainTOCEntry);

	var body = mainDoc.getBody();


	for (var key in dict_aa)
		{
		var paragraph_bb = mainDoc.createElement("p");
		var dict_unit = dict_aa[key];
		var name = dict_unit["name"];
		var str_population = dict_unit["population"];
		var population = Integer.parseInt (str_population);
		var date_mod = dict_unit["date_mod"];
		paragraph_bb.add (key);
		paragraph_bb.add (" ");
		paragraph_bb.add (name);
		paragraph_bb.add (" ");
		paragraph_bb.add (str_population);
		paragraph_bb.add (" ");
		paragraph_bb.add (date_mod);
		body.add (paragraph_bb);
		}

		var writer = new OCFContainerWriter(
				new FileOutputStream (epub_file));
		epub.serialize(writer);
}

// ----------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc
		(dict_aa,"t1931","甲府",29635,"1951-2-15");

	dict_aa = dict_append_proc
		(dict_aa,"t1932","富士吉田",91427,"1951-4-23");

	dict_aa = dict_append_proc
		(dict_aa,"t1933","都留",71523,"1951-5-24");

	dict_aa = dict_append_proc
		(dict_aa,"t1934","山梨",18624,"1951-9-14");

	dict_aa = dict_append_proc
		(dict_aa,"t1935","大月",72531,"1951-8-12");

	dict_aa = dict_append_proc
		(dict_aa,"t1936","韮崎",28569,"1951-7-28");

	dict_aa = dict_append_proc
		(dict_aa,"t1937","南アルプス",31457,"1951-6-19");

	dict_aa = dict_append_proc
		(dict_aa,"t1938","北杜",47382,"1951-11-15");

	dict_aa = dict_append_proc
		(dict_aa,"t1939","甲斐",56172,"1951-10-24");

	return	dict_aa;
}

// ----------------------------------------------------------
