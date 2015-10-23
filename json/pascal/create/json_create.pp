(* ------------------------------------------------------------------ *)
(*
	json_create.pp

					Aug/22/2011
*)
(* ------------------------------------------------------------------ *)
program json_create;
(* ------------------------------------------------------------------ *)
procedure	tag_out_proc (var ufile: text;tag,value: string);
begin
	write (ufile,'"');
	write (ufile,tag);
	write (ufile,'": "');
	write (ufile,value);
	write (ufile,'"');
end;
(* ------------------------------------------------------------------ *)
procedure	out_proc (var ufile: text;id,name,population,date_mod,delim: string);
begin
	write (ufile,'"');
	write (ufile,id);
	write (ufile,'": {');
	tag_out_proc (ufile,'name',name);
	write (ufile,',');
	tag_out_proc (ufile,'population',population);
	write (ufile,',');
	tag_out_proc (ufile,'date_mod',date_mod);
	write (ufile,'}');
	writeln (ufile,delim);
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

	writeln (ufile,'{');
	out_proc (ufile,'t0921','宇都宮','79824','1967-4-24',',');
	out_proc (ufile,'t0922','小山','52637','1967-10-21',',');
	out_proc (ufile,'t0923','佐野','34573','1967-5-16',',');
	out_proc (ufile,'t0924','足利','52492','1967-9-23',',');
	out_proc (ufile,'t0925','日光','41851','1967-3-9',',');
	out_proc (ufile,'t0926','下野','82513','1967-5-19',',');
	out_proc (ufile,'t0927','さくら','51748','1967-9-12',',');
	out_proc (ufile,'t0928','矢板','94782','1967-8-18',',');
	out_proc (ufile,'t0929','真岡','57524','1967-7-11',',');
	out_proc (ufile,'t0930','栃木','52813','1967-9-18',',');
	out_proc (ufile,'t0931','大田原','81629','1967-5-21',',');
	out_proc (ufile,'t0932','鹿沼','45371','1967-4-23',',');
	out_proc (ufile,'t0933','那須塩原','39815','1967-8-27',',');
	out_proc (ufile,'t0934','那須烏山','59267','1967-9-26','}');

	close (ufile);
	writeln ('*** 終了 ***');
end.

(* ------------------------------------------------------------------ *)
