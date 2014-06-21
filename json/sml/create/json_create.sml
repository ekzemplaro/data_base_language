(* -------------------------------------------------------------- *)
(*
	json_create.sml

					Aug/22/2011
*)
(* -------------------------------------------------------------- *)
fun record_gen (id:string,name:string,population:string,date_mod:string,tx:string) =
	"\"" ^ id ^ "\": {" ^
	"\"name\":\"" ^ name ^ "\"," ^
	"\"population\":" ^ population ^ "," ^
	"\"date_mod\":\"" ^ date_mod ^ "\"}" ^
	tx ^ "\n";
(* -------------------------------------------------------------- *)
open TextIO;

print "*** 開始 ***\n";
val file_out = "/var/tmp/json/cities.json";

val aa = openOut (file_out);

output (aa,"{");
output (aa,record_gen ("t0921","宇都宮","45736","1994-4-7",","));
output (aa,record_gen ("t0922","小山","38785","1994-5-4",","));
output (aa,record_gen ("t0923","佐野","76272","1994-8-21",","));
output (aa,record_gen ("t0924","足利","91685","1994-9-15",","));
output (aa,record_gen ("t0925","日光","34246","1994-6-19",","));
output (aa,record_gen ("t0926","下野","61298","1994-6-14",","));
output (aa,record_gen ("t0927","さくら","21725","1994-3-11",","));
output (aa,record_gen ("t0928","矢板","41981","1994-9-12",","));
output (aa,record_gen ("t0929","真岡","38253","1994-8-23",","));
output (aa,record_gen ("t0930","栃木","72382","1994-2-4",","));
output (aa,record_gen ("t0931","大田原","25181","1994-7-8",","));
output (aa,record_gen ("t0932","鹿沼","83576","1994-9-19",","));
output (aa,record_gen ("t0933","那須塩原","91357","1994-1-21",","));
output (aa,record_gen ("t0934","那須烏山","62564","1994-12-7","}"));


closeOut (aa);

print "*** 終了 ***\n";

OS.Process.exit (OS.Process.success);
(* -------------------------------------------------------------- *)
