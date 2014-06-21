-- ----------------------------------------------------------------
--	json_create.adb
--
--						Oct/10/2011
--
-- ----------------------------------------------------------------
with Ada.Text_IO;               use Ada.Text_IO; 
with Ada.Text_IO.Text_Streams;  use Ada.Text_IO.Text_Streams;
with Ada.Command_Line;
 
-- ----------------------------------------------------------------
procedure json_create is
	procedure record_out_proc
		(Outfile : File_Type;
		key: in String;
		name: in String;
		population: in String;
		date_mod: in String;
		tx: in String) is
	begin
		Ada.Text_IO.Put_Line("*** record_out_proc ***");
		String'Write (Stream (Outfile),
			'"' & key & '"' & ":{" &
			'"' & "name" & '"' & ":" &
			'"' & name & '"' & "," &
			'"' & "population" & '"' & ":" &
			'"' & population & '"' & "," &
			'"' & "date_mod" & '"' & ":" &
			'"' & date_mod & '"' & "}" &
			tx & ASCII.LF);
	end record_out_proc;

	Outfile : File_Type;
	file_text  : String := Ada.Command_Line.Argument (1);
	str_out : String := "<?xml version=" & '"' & "1.0" & '"' & " encoding=" & '"' & "utf-8" & '"' & "?>"; 
begin
	Ada.Text_IO.Put_Line("*** 開始 ***");

	Create (File => Outfile, Mode => Out_File, Name => file_text);

	String'Write (Stream (Outfile),"{" & ASCII.LF);

	record_out_proc (Outfile,"t0921","宇都宮","43982","1943-6-28",",");
	record_out_proc (Outfile,"t0922","小山","82467","1943-3-15",",");
	record_out_proc (Outfile,"t0923","佐野","39254","1943-8-9",",");
	record_out_proc (Outfile,"t0924","足利","54792","1943-6-3",",");
	record_out_proc (Outfile,"t0925","日光","84327","1943-1-12",",");
	record_out_proc (Outfile,"t0926","下野","32198","1943-2-7",",");
	record_out_proc (Outfile,"t0927","さくら","54982","1943-10-21",",");
	record_out_proc (Outfile,"t0928","矢板","97623","1943-5-12",",");
	record_out_proc (Outfile,"t0929","真岡","47835","1943-4-24",",");
	record_out_proc (Outfile,"t0930","栃木","83592","1943-8-12",",");
	record_out_proc (Outfile,"t0931","大田原","59276","1943-5-15",",");
	record_out_proc (Outfile,"t0932","鹿沼","32987","1943-9-18",",");
	record_out_proc (Outfile,"t0933","那須塩原","21458","1943-3-24",",");
	record_out_proc (Outfile,"t0934","那須烏山","57832","1943-6-9","}");
	Close (Outfile);

	Ada.Text_IO.Put_Line("*** 終了 ***");

end json_create;
-- ----------------------------------------------------------------
