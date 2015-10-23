(* ------------------------------------------------------------------ *)
(*
	text_read.pp

					Apr/21/2011
*)
(* ------------------------------------------------------------------ *)
program text_read;
var	ufile: text;
	file_in: string;
	TFile: string;
begin
	writeln ('*** 開始 ***');
	writeln ('Parameter = ', paramstr(1) );

	file_in := paramstr(1);

	assign (ufile, file_in); 

	reset (ufile);
	repeat
		readln (ufile,TFile);
		writeln (TFile);
	until eof (ufile);

	close (ufile);

	writeln ('*** 終了 ***');
end.
(* ------------------------------------------------------------------ *)
