(* ------------------------------------------------------------------ *)
(*
	text_update.pp

					Apr/18/2011
*)
(* ------------------------------------------------------------------ *)
program text_update;
Uses sysutils;

(* ------------------------------------------------------------------ *)
function string_gen_proc (id,name,population,date_mod: string) : string;
var
	str_out: string;
begin
	str_out := id + #9 + name + #9 + population + #9 + date_mod + #10;

	string_gen_proc := str_out;
end;
(* ------------------------------------------------------------------ *)
function line_update_proc (line,population_in: string) : string;
var
	id : string;
	name : string;
	date_mod : string;
	line_bb : string;
	pp : integer;
	qq : integer;
	llx : integer;
	S : AnsiString;
begin
	llx := length (line);
	pp := pos (#9,line);
	id := copy (line,1,pp - 1);
	line_bb := copy (line,pp+1,llx);
	qq := pos (#9,line_bb);
	name := copy (line_bb,1,qq - 1);
	DateTimeToString(S,'yyyy-mm-dd',Now);
	date_mod := S;
	writeln (name);
	line_update_proc := string_gen_proc (id,name,population_in,date_mod);
end;
(* ------------------------------------------------------------------ *)
var
	ufile: text;
	fp_out: text;
	file_txt: string;
	line: string;

	id_in : string;
	population_in : string;
	id : string;
	pp : integer;
	llx : integer;
	str_out: string;
begin
	writeln ('*** 開始 ***');
	file_txt := paramstr(1);
	id_in := paramstr(2);
	population_in := paramstr(3);
	writeln ('file_in = ', file_txt);
	writeln ('id_in = ', id_in);
	writeln ('population_in = ', population_in);

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
				str_out := str_out + line + #10
			else
				str_out := str_out + line_update_proc (line,population_in);
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
