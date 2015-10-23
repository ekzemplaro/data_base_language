(* ------------------------------------------------------------------ *)
(*
	text_create.pp

					Jan/24/2014
*)
(* ------------------------------------------------------------------ *)
program byeworld;
(* ------------------------------------------------------------------ *)
procedure	out_proc (var ufile: text;id,name,population,date_mod: string);
begin
	write (ufile,id);
	write (ufile,#9);
	write (ufile,name);
	write (ufile,#9);
	write (ufile,population);
	write (ufile,#9);
	writeln (ufile,date_mod);
end;
(* ------------------------------------------------------------------ *)
var	ufile: text;
	file_out: string;
begin
	writeln ('*** 開始 ***');

	file_out := ParamStr(1);
	writeln( 'file_out = ',file_out );

	assign (ufile,file_out);
	rewrite (ufile);

	out_proc (ufile,'t2381','名古屋','79124','1967-5-14');
	out_proc (ufile,'t2382','豊橋','52617','1967-10-18');
	out_proc (ufile,'t2383','岡崎','34589','1967-1-16');
	out_proc (ufile,'t2384','一宮','52461','1967-8-23');
	out_proc (ufile,'t2385','蒲郡','41857','1967-3-9');
	out_proc (ufile,'t2386','常滑','82453','1967-5-19');
	out_proc (ufile,'t2387','大府','51748','1967-9-12');
	out_proc (ufile,'t2388','瀬戸','94672','1967-8-28');
	out_proc (ufile,'t2389','犬山','57364','1967-7-19');

	close (ufile);
	writeln ('*** 終了 ***');
end.

(* ------------------------------------------------------------------ *)
