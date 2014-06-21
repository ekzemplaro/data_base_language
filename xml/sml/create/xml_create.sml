(* -------------------------------------------------------------- *)
(*
	xml_create.sml

					Aug/22/2011
*)
(* -------------------------------------------------------------- *)
fun record_gen (id:string,name:string,population:string,date_mod:string) =
	"<" ^ id ^ ">" ^
	"<name>" ^ name ^ "</name>" ^
	"<population>" ^ population ^ "</population>" ^
	"<date_mod>" ^ date_mod ^ "</date_mod></" ^ id ^ ">\n";
(* -------------------------------------------------------------- *)
open TextIO;

print "*** 開始 ***\n";
val file_out = "/var/tmp/xml_file/cities.xml";

val aa = openOut (file_out);

output (aa,"<?xml version=\"1.0\"?>\n");
output (aa,"<root>\n");
output (aa,record_gen ("t2261","静岡","48157","1994-4-7"));
output (aa,record_gen ("t2262","浜松","32785","1994-5-4"));
output (aa,record_gen ("t2263","沼津","76527","1994-8-21"));
output (aa,record_gen ("t2264","三島","91968","1994-9-15"));
output (aa,record_gen ("t2265","富士","34246","1994-10-19"));
output (aa,record_gen ("t2266","熱海","61729","1994-6-14"));
output (aa,record_gen ("t2267","富士宮","21657","1994-3-11"));
output (aa,record_gen ("t2268","藤枝","47932","1994-9-12"));
output (aa,record_gen ("t2269","御殿場","31825","1994-8-23"));
output (aa,record_gen ("t2270","島田","42539","1994-2-4"));
output (aa,"</root>\n");


closeOut (aa);

print "*** 終了 ***\n";

OS.Process.exit (OS.Process.success);
(* -------------------------------------------------------------- *)
