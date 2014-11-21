// -----------------------------------------------------------------------
//	reference.js
//
//					Nov/11/2014
// -----------------------------------------------------------------------
function reference (lang)
{
	var hantei = false;

	if ((lang == "node.js") || (lang == "Rhino")
		|| (lang == "ejs") || (lang == "ringo")
		|| (lang == "Coffee")
		|| (lang == "PHP") || (lang == "Python")
		|| (lang == "Perl") || (lang == "Ruby")
		|| (lang == "Jython") || (lang == "Jruby")
		|| (lang == "SPL")
		|| (lang == "Lua") || (lang == "tcl")
		|| (lang == "Haskell")
		|| (lang == "io")
		|| (lang == "Ocaml")
		|| (lang == "Erlang")
		|| (lang == "pike")
		|| (lang == "go")
		|| (lang == "C++")
		|| (lang == "vala")
		|| (lang == "D")
		|| (lang == "Clojure") || (lang == "Gauche")
		|| (lang == "guile")
		|| (lang == "Clisp") || (lang == "allegro")
		|| (lang == "sbcl") || (lang == "clozure") 
		|| (lang == "abcl") || (lang == "ecl")
		|| (lang == "cmucl")|| (lang == "elisp")
		|| (lang == "rep") || (lang == "PicoLisp")
		|| (lang == "newlisp")
		|| (lang == "Scala")
		|| (lang == "Groovy") || (lang == "Java")
		|| (lang == "boo")
		|| (lang == "Fsharp") || (lang == "Csharp")
//		|| (lang == "F#") || (lang == "C#")
		|| (lang == "Haxe") || (lang == "bsh")
		|| (lang == "falcon")
		|| (lang == "julia")
		|| (lang == "octave"))
		{
		hantei = true;
		}

	return	hantei;
}
// -----------------------------------------------------------------------
