// --------------------------------------------------------------------
//	rhino/by_language/by_language.js
//
//					Mar/14/2017
// --------------------------------------------------------------------
importPackage (java.io);
// --------------------------------------------------------------------
//print('*** start ***');
main_proc ();
//print('*** end ***');
// --------------------------------------------------------------------
function main_proc ()
{
	print	("<ol>");

	lang_gen ("bash","sh");
	lang_gen ("php","php");
	lang_gen ("python","py");
	lang_gen ("jython","py");
	lang_gen ("perl","pl");
	lang_gen ("ruby","rb");
	lang_gen ("jruby","rb");
	lang_gen ("lua","lua");
	lang_gen ("tcl","tcl");
	lang_gen ("io","io");


	lang_gen ("haskell","hs");
	lang_gen ("kaya","k");
	lang_gen ("sml","sml");
	lang_gen ("ocaml","ml");
	lang_gen ("erlang","erl");


	lang_gen ("spl","spl");
	lang_gen ("slang","sl");
	lang_gen ("gst","st");
	lang_gen ("rebol","r");
	lang_gen ("pascal","pp");

	lang_gen ("gambas","gambas");
	lang_gen ("gfortran","f95");
	lang_gen ("cobol","cob");
	lang_gen ("swipl","pl");
	lang_gen ("ada","adb");
	lang_gen ("R","R");
	lang_gen ("J","ijs");

	lang_gen ("clojure","clj");
	lang_gen ("gauche","scm");
	lang_gen ("guile","scm");
	lang_gen ("clisp","lsp");
	lang_gen ("allegro","cl");
	lang_gen ("sbcl","lisp");
	lang_gen ("gcl","lsp");
	lang_gen ("clozure","lisp");
	lang_gen ("abcl","lisp");
	lang_gen ("ecl","lisp");
	lang_gen ("cmucl","lisp");


	lang_gen ("rep","jl");
	lang_gen ("pico","l");
	lang_gen ("elisp","el");
	lang_gen ("newlisp","lsp");

	lang_gen ("pike","pike");
	lang_gen ("go","go");
	lang_gen ("cplus","cpp");
	lang_gen ("vala","vala");
	lang_gen ("D","d");
	lang_gen ("cython","pyx");

	lang_gen ("node","js");
	lang_gen ("rhino","js");
	lang_gen ("ejs","es");
	lang_gen ("ringo","js");
	lang_gen ("coffee","coffee");

	lang_gen ("scala","scala");
	lang_gen ("groovy","groovy");
	lang_gen ("java","java");

	lang_gen ("boo","boo");
	lang_gen ("fsharp","fs");
	lang_gen ("csharp","cs");

	lang_gen ("haxe","hx");
	lang_gen ("bsh","bsh");
	lang_gen ("falcon","fal");
	lang_gen ("racket","rkt");
	lang_gen ("typescript","ts");
	lang_gen ("julia","jl");
	lang_gen ("octave","m");
	lang_gen ("rust","rs");
	lang_gen ("dart","dart");
	lang_gen ("kotlin","kt");
	lang_gen ("vb","vb");
	lang_gen ("elixir","exs");
	lang_gen ("nashorn","js");

	print	("</ol>");
	print	("</div>");
}

// --------------------------------------------------------------------
// [4]:
function lang_gen (lang,suffix)
{
	title= "<div class=\"section\" id=\"" + lang + "\">\n";

	title += "<li><h2><a href=/data_base/doc/language/" + lang + ".html>"
	title  += lang + "</a></h2></li>";
	print	(title);

	print	("<table border=\"1\">");

	db_gen (lang,suffix,"Plain Text","text");
	db_gen (lang,suffix,"CSV","csv");
	db_gen (lang,suffix,"XML File","xml");
	db_gen (lang,suffix,"JSON","json");
	db_gen (lang,suffix,"Calc","calc");
	db_gen (lang,suffix,"Excel","excel");
	db_gen (lang,suffix,"PDF","pdf");
	db_gen (lang,suffix,"EPUB","epub");
	db_gen (lang,suffix,"SQLite 3","sqlite3");

	db_gen (lang,suffix,"Oracle","oracle");
	db_gen (lang,suffix,"MS SQLServer","mssql");
	db_gen (lang,suffix,"DB2","db2");

	db_gen (lang,suffix,"MySQL","mysql");
	db_gen (lang,suffix,"PostgreSQL","postgre");
	db_gen (lang,suffix,"Firebird","firebird");

	db_gen (lang,suffix,"Derby","derby");
	db_gen (lang,suffix,"HSQLDB","hsqldb");
	db_gen (lang,suffix,"H2","h2");

	db_gen (lang,suffix,"xindice","xindice");
	db_gen (lang,suffix,"eXist","exist");
	db_gen (lang,suffix,"baseX","basex");
	db_gen (lang,suffix,"dbXML","dbxml");

	db_gen (lang,suffix,"GNU dbm","gdbm");
	db_gen (lang,suffix,"Berkeley DB","berkeley");
	db_gen (lang,suffix,"cdb","cdb");
	db_gen (lang,suffix,"memcached","mcached");
	db_gen (lang,suffix,"memcachedb","mcachedb");
	db_gen (lang,suffix,"Redis","redis");
	db_gen (lang,suffix,"Tokyo Cabinet","tcbn");
	db_gen (lang,suffix,"Tokyo Tyrant","tyrant");

	db_gen (lang,suffix,"CouchDB","couch");
	db_gen (lang,suffix,"ftp","ftp");
	db_gen (lang,suffix,"mongoDB","mongo");
	db_gen (lang,suffix,"cassandra","cassandra");
	db_gen (lang,suffix,"VoldDB","voltdb");
	db_gen (lang,suffix,"HBase","hbase");
	db_gen (lang,suffix,"Voldemort","voldemort");
	db_gen (lang,suffix,"neo4j","neo4j");
	db_gen (lang,suffix,"hgdb","hgdb");

	db_gen (lang,suffix,"riak","riak");
	db_gen (lang,suffix,"xlsx","xlsx");
	db_gen (lang,suffix,"maria","maria");
	db_gen (lang,suffix,"PouchDB","pouch");
	db_gen (lang,suffix,"DynamoDB","dynamo");
	print	("</table>");
	print	("</div>\n\n");
}

// --------------------------------------------------------------------
function db_gen (lang,suffix,dbname,key_a)
{

	crud_gen (key_a,lang,suffix);
}

// --------------------------------------------------------------------
// [4]:
function crud_gen (key_a,lang,suffix)
{
	var crud = ["create","read","update","delete"];

	var folder = "/var/www/data_base/" + key_a + "/" + lang;

	var objFile = new File (folder);

	if (objFile.exists ())
	{
	
	print	("<tr>");
	head  = "<td>" + key_a +  "</td>";
	print	(head);
	for (val in crud)
		{
		fname= key_a + "_" + crud[val] + "." + suffix;

	var folder_crud = folder + "/" + crud[val];
	var objFile_crud = new File (folder_crud);
	out_str="<td>";

	if (objFile_crud.exists ())
	{
		out_str += "<a href=\"/data_base/" + key_a + "/";
		out_str += lang + "/" + crud[val] + "/";
		out_str += fname + ".txt\">";
		out_str += fname + "</a>";
	}
	else
		{
		out_str += fname;
		}

		out_str += "</td>";
		print	(out_str);
		}
	print	("</tr>");

	}
}

// --------------------------------------------------------------------
