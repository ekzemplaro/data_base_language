// -----------------------------------------------------------------------
//	target_define.js
//
//					Oct/31/2014
// -----------------------------------------------------------------------
function target_define_proc (lang_mod,dbase,crud)
{
	var dbase_lower = dbase.toLowerCase ();
	var crud_lower = crud.toLowerCase ();

	var target;

	switch (crud_lower)
		{
		case	"create":
		case	"read":
		case	"update":
		case	"delete":
			target = target_define_proc_crud_console
				 (lang_mod,dbase_lower,crud_lower);
			break;

		case	"jq_create":
		case	"jq_read":
		case	"jq_update":
		case	"jq_delete":
			target = target_define_proc_crud_jquery
				 (lang_mod,dbase_lower,crud_lower);
			break;

		default:
			target = target_define_proc_reference
				 (lang_mod,dbase_lower,crud);
		}

// jQuery ("#outarea_bb").text ("bb: " + target);

	return	target;
}

// -----------------------------------------------------------------------
function target_define_proc_reference (lang_mod,dbase_lower,crud_lower)
{
	var src_code = "/data_base/common/" + lang_mod + "_common/html_src/";
	src_code += crud_lower + ".txt";

	var makefile = "";
	var execute = "";

	return	[src_code,makefile,execute];
}

// -----------------------------------------------------------------------
function target_define_proc_crud_console (lang_mod,dbase_lower,crud_lower)
{
	var target_folder = "/data_base/" + dbase_lower;
	target_folder += "/" + lang_mod;
	target_folder += "/" + crud_lower;

	var suffix_array = suffix_define_proc ();

	var target_file = dbase_lower + "_" + crud_lower;
	target_file += "." + suffix_array[lang_mod] + ".txt";

	var src_code = target_folder + "/" +  target_file;

	var makefile = "";

	switch (lang_mod)
		{
		case	"kaya":
		case	"pascal":
		case	"boo":
		case	"gfortan":
		case	"cobol":
		case	"ocaml":
		case	"go":
		case	"cplus":
		case	"vala":
		case	"D":
		case	"cython":
		case	"scala":
		case	"groovy":
		case	"java":
		case	"fsharp":
		case	"csharp":
		case	"haxe":
		case	"typescript":
	 		makefile = target_folder + "/" +  "Makefile.txt";
			break;
		}

	var script = "gox.txt";

	if (crud_lower == "update")
		{
		script = "go_up.txt";
		}
	else if (crud_lower == "delete")
		{
		script = "go_del.txt";
		}

	var execute = target_folder + "/" +  script;

	return	[src_code,makefile,execute];
}

// -----------------------------------------------------------------------
function lang_define_proc (lang)
{
	var lang_mod = lang.toLowerCase ();

	if (lang_mod === "picolisp")
		{
		lang_mod = "pico";
		}
	else if (lang_mod === "r")
		{
		lang_mod = "R";
		}
	else if (lang_mod === "j")
		{
		lang_mod = "J";
		}
	else if (lang_mod === "c++")
		{
		lang_mod = "cplus";
		}
	else if (lang_mod === "d")
		{
		lang_mod = "D";
		}
	else if (lang_mod === "node.js")
		{
		lang_mod = "node";
		}
	else if (lang_mod === "f#")
		{
		lang_mod = "fsharp";
		}
	else if (lang_mod === "c#")
		{
		lang_mod = "csharp";
		}

	return	lang_mod;
}

// -----------------------------------------------------------------------
function suffix_define_proc ()
{
	var suffix = new Array ();

	suffix["bash"] = "sh";
	suffix["php"] = "php";
	suffix["python"] = "py";
	suffix["jython"] = "py";
	suffix["perl"] = "pl";
	suffix["ruby"] = "rb";
	suffix["jruby"] = "rb";
	suffix["haskell"] = "hs";
	suffix["kaya"] = "k";
	suffix["spl"] = "spl";
	suffix["slang"] = "sl";
	suffix["pike"] = "pike";
	suffix["gst"] = "st";
	suffix["rebol"] = "r";
	suffix["pascal"] = "pp";
	suffix["boo"] = "boo";
	suffix["gambas"] = "gambas";
	suffix["gfortran"] = "f95";
	suffix["cobol"] = "cob";
	suffix["ada"] = "adb";
	suffix["swipl"] = "pl";

	suffix["clojure"] = "clj";
	suffix["gauche"] = "scm";
	suffix["guile"] = "scm";
	suffix["clisp"] = "lsp";
	suffix["allegro"] = "cl";
	suffix["sbcl"] = "lisp";
	suffix["gcl"] = "lsp";
	suffix["clozure"] = "lisp";
	suffix["abcl"] = "lisp";
	suffix["ecl"] = "lisp";
	suffix["cmucl"] = "lisp";

	suffix["rep"] = "jl";
	suffix["pico"] = "l";
	suffix["elisp"] = "el";
	suffix["newlisp"] = "lsp";

	suffix["sml"] = "sml";
	suffix["ocaml"] = "ml";
	suffix["erlang"] = "erl";
	suffix["lua"] = "lua";
	suffix["tcl"] = "tcl";
	suffix["io"] = "io";
	suffix["R"] = "R";
	suffix["J"] = "ijs";

	suffix["go"] = "go";
	suffix["cplus"] = "cpp";
	suffix["vala"] = "vala";
	suffix["D"] = "d";
	suffix["cython"] = "pyx";

	suffix["node"] = "js";
	suffix["rhino"] = "js";
	suffix["ejs"] = "es";
	suffix["ringo"] = "js";
	suffix["coffee"] = "coffee";

	suffix["scala"] = "scala";
	suffix["groovy"] = "groovy";
	suffix["java"] = "java";
	suffix["fsharp"] = "fs";
	suffix["csharp"] = "cs";

	suffix["haxe"] = "hx";
	suffix["bsh"] = "bsh";
	suffix["falcon"] = "fal";
	suffix["racket"] = "rkt";
	suffix["typescript"] = "ts";
	suffix["julia"] = "jl";
	suffix["octave"] = "m";

	return	suffix;
}

// -----------------------------------------------------------------------
function target_define_proc_crud_jquery (lang_mod,dbase_lower,crud_lower)
{
	var target_folder = "/data_base/lang/jquery_" + lang_mod;
	target_folder += "/" + crud_lower.substring (3) + "/html_src";

	var suffix_array = suffix_define_proc ();

	var suffix = suffix_array[lang_mod];

	if (suffix === "cs")
		{
		suffix = "aspx.cs";
		}

	suffix += ".txt";

	var target_file = dbase_lower + "_" + lang_mod + "_";
	target_file += crud_lower.substring (3);
	target_file += "." + suffix;


	var src_code = target_folder + "/" +  target_file;

	var makefile = "";
	var execute = "";

	return	[src_code,makefile,execute];
}
// -----------------------------------------------------------------------
