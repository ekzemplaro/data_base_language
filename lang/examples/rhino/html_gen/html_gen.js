// --------------------------------------------------------------------
//	html_gen.js
//
//					Oct/31/2014
// --------------------------------------------------------------------
importPackage (java.io);
// --------------------------------------------------------------------
// print('*** start ***');
	print	("<ol>");

db_gen ("Plain Text","text");
db_gen ("CSV","csv");
db_gen ("XML File","xml");
db_gen ("JSON","json");
db_gen ("Calc","calc");
db_gen ("Excel","excel");
db_gen ("PDF","pdf");
db_gen ("EPUB","epub");
db_gen ("SQLite 3","sqlite3");

db_gen ("Oracle","oracle");
db_gen ("MS SQLServer","mssql");
db_gen ("DB2","db2");

db_gen ("MySQL","mysql");
db_gen ("PostgreSQL","postgre");
db_gen ("Firebird","firebird");
db_gen ("Drizzle","drizzle");

db_gen ("Derby","derby");
db_gen ("HSQLDB","hsqldb");
db_gen ("H2","h2");

db_gen ("xindice","xindice");
db_gen ("eXist","exist");
db_gen ("baseX","basex");
db_gen ("dbxml","dbxml");

db_gen ("GNU dbm","gdbm");
db_gen ("Berkeley DB","berkeley");
db_gen ("cdb","cdb");
db_gen ("memcached","mcached");
db_gen ("memcachedb","mcachedb");
db_gen ("Redis","redis");
db_gen ("Tokyo Cabinet","tcbn");
db_gen ("Tokyo Tyrant","tyrant");

db_gen ("CouchDB","couch");
db_gen ("ftp","ftp");
db_gen ("WebDAV","webdav");

db_gen ("mongoDB","mongo");
db_gen ("cassandra","cassandra");
db_gen ("VoltDB","voltdb");
db_gen ("HBase","hbase");
db_gen ("Voldemort","voldemort");
db_gen ("neo4j","neo4j");
db_gen ("hgdb","hgdb");

db_gen ("riak","riak");
db_gen ("xlsx","xlsx");
db_gen ("maria","maria");

	print	("</ol>");
	print	("</div>");
// print('*** end ***');

// --------------------------------------------------------------------
function db_gen (dbname,key_a)
{
	title= "<div class=\"section\" id=\"" + dbname + "\">\n";

	title += "<li><h2><a href=\"/data_base/doc/data_base/" + key_a + ".html\">"
	title  += dbname + "</a></h2></li>";
	print	(title);
	print	("<table border=\"1\">");
	lang_gen (key_a);
	print	("</table>");
	print	("</div>\n");
}

// --------------------------------------------------------------------
function lang_gen (key_a)
{
	crud_gen (key_a,"bash","sh");
	crud_gen (key_a,"php","php");
	crud_gen (key_a,"python","py");
	crud_gen (key_a,"jython","py");
	crud_gen (key_a,"perl","pl");
	crud_gen (key_a,"ruby","rb");
	crud_gen (key_a,"jruby","rb");
	crud_gen (key_a,"lua","lua");
	crud_gen (key_a,"tcl","tcl");
	crud_gen (key_a,"io","io");


	crud_gen (key_a,"haskell","hs");
	crud_gen (key_a,"kaya","k");
	crud_gen (key_a,"sml","sml");
	crud_gen (key_a,"ocaml","ml");
	crud_gen (key_a,"erlang","erl");



	crud_gen (key_a,"spl","spl");
	crud_gen (key_a,"slang","sl");
	crud_gen (key_a,"gst","st");
	crud_gen (key_a,"rebol","r");
	crud_gen (key_a,"pascal","pp");
	crud_gen (key_a,"gambas","gambas");
	crud_gen (key_a,"gfortran","f95");
	crud_gen (key_a,"cobol","cob");
	crud_gen (key_a,"swipl","pl");
	crud_gen (key_a,"R","R");
	crud_gen (key_a,"J","ijs");

	crud_gen (key_a,"clojure","clj");
	crud_gen (key_a,"gauche","scm");
	crud_gen (key_a,"guile","scm");
	crud_gen (key_a,"clisp","lsp");
	crud_gen (key_a,"allegro","cl");
	crud_gen (key_a,"sbcl","lisp");
	crud_gen (key_a,"gcl","lsp");
	crud_gen (key_a,"clozure","lisp");
	crud_gen (key_a,"abcl","lisp");
	crud_gen (key_a,"ecl","lisp");
	crud_gen (key_a,"cmucl","lisp");

	crud_gen (key_a,"rep","jl");
	crud_gen (key_a,"pico","l");
	crud_gen (key_a,"elisp","el");
	crud_gen (key_a,"newlisp","lsp");

	crud_gen (key_a,"pike","pike");
	crud_gen (key_a,"go","go");
	crud_gen (key_a,"cplus","cpp");
	crud_gen (key_a,"vala","vala");
	crud_gen (key_a,"D","d");

	crud_gen (key_a,"node","js");
	crud_gen (key_a,"rhino","js");
	crud_gen (key_a,"ejs","es");
	crud_gen (key_a,"ringo","js");
	crud_gen (key_a,"coffee","coffee");

	crud_gen (key_a,"scala","scala");
	crud_gen (key_a,"groovy","groovy");
	crud_gen (key_a,"java","java");
	crud_gen (key_a,"boo","boo");
	crud_gen (key_a,"fsharp","fs");
	crud_gen (key_a,"csharp","cs");

	crud_gen (key_a,"haxe","hx");
	crud_gen (key_a,"bsh","bsh");
	crud_gen (key_a,"falcon","fal");
	crud_gen (key_a,"racket","rkt");
	crud_gen (key_a,"typescript","ts");
	crud_gen (key_a,"julia","jl");
	crud_gen (key_a,"octave","m");
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
	head  = "<td>" + lang +  "</td>";
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
