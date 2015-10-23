(* ------------------------------------------------------------------ *)
(*
	text_delete.pp

					Apr/21/2011
*)
(* ------------------------------------------------------------------ *)
program text_delete;
var	ufile: text;
	fp_out: text;
	file_txt: string;
	line: string;

	id_in : string;
	id : string;
	pp : integer;
	llx : integer;
	str_out: string;
begin
	writeln ('*** 開始 ***');
	file_txt := paramstr(1);
	id_in := paramstr(2);
	writeln ('file_in = ', file_txt);
	writeln ('id_in = ', id_in);

	str_out := '';

	assign (ufile, file_txt); 
	reset (ufile);

	repeat
		readln (ufile,line);
		llx := length (line);
		if (5 < llx) then
			begin
			pp := pos (#9,line);
			id := copy (line,1,pp - 1);

			if (id <> id_in) then
				str_out := str_out + line + #10;
			end;
	until eof (ufile);
	close (ufile);

	write (str_out);

	assign (fp_out, file_txt); 
	rewrite (fp_out);

	write (fp_out,str_out);
	close (fp_out);

	writeln ('*** 終了 ***');
end.
(* ------------------------------------------------------------------ *)
