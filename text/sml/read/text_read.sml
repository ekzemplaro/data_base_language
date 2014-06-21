(* -------------------------------------------------------------- *)
(*
	text_read.sml

					Nov/01/2010
*)
(* -------------------------------------------------------------- *)

fun file_cat_proc( filename ) =
    let
      open TextIO
      val a = openIn( filename )
      fun cat_sub( NONE ) = ()
      |   cat_sub( SOME c ) = (output1( stdOut, c ); cat_sub( input1( a ) ))  
    in
      cat_sub( input1( a ) );
      closeIn( a )
    end;


(* -------------------------------------------------------------- *)
print "*** 開始 ***\n";

file_cat_proc "/var/tmp/plain_text/cities.txt";

print "*** 終了 ***\n";

OS.Process.exit (OS.Process.success);

(* -------------------------------------------------------------- *)
