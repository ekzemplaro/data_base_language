(* -------------------------------------------------------------- *)
(*
	text_create.sml

					Jul/10/2011
*)
(* -------------------------------------------------------------- *)
open TextIO;

print "*** 開始 ***\n";
val file_out = "/var/tmp/plain_text/cities.txt";

val aa = openOut (file_out);
output (aa,"t2381\t名古屋\t47825\t1994-12-24\n");
output (aa,"t2382\t豊橋\t21157\t1994-11-25\n");
output (aa,"t2383\t岡崎\t78741\t1994-9-2\n");
output (aa,"t2384\t一宮\t38704\t1994-6-25\n");
output (aa,"t2385\t蒲郡\t40352\t1994-8-14\n");
output (aa,"t2386\t常滑\t60218\t1994-9-12\n");
output (aa,"t2387\t大府\t30201\t1994-3-21\n");
output (aa,"t2388\t瀬戸\t50406\t1994-7-26\n");
output (aa,"t2389\t犬山\t20807\t1994-10-2\n");

closeOut (aa);

print "*** 終了 ***\n";

OS.Process.exit (OS.Process.success);
(* -------------------------------------------------------------- *)
