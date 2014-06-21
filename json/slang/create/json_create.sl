#! /usr/bin/slsh
%
%	json_create.sl
%
%					Aug/30/2013
% --------------------------------------------------------------------
require ("cmdopt");

% --------------------------------------------------------------------
define tag_out_proc (tag,value )
{
	variable out_str = "\"" + tag + "\": \"";

	out_str += value;

	out_str += "\"";

	return out_str;
}

% --------------------------------------------------------------------
define record_gen_proc (id,name,population,date_mod)
{
	variable out_str = "\"";
	out_str += id;
	out_str += "\": {";
	out_str += tag_out_proc ("name",name);
	out_str += ",";
	out_str += tag_out_proc ("population",population);
	out_str += ",";
	out_str += tag_out_proc ("date_mod",date_mod);
	out_str += "},\n";

	return out_str;
}

% --------------------------------------------------------------------
define data_prepare_proc ()
{
	variable line = record_gen_proc ("t0921","宇都宮","82517","1963-9-30");
	line += record_gen_proc ("t0922","小山","24681","1963-2-10");
	line += record_gen_proc ("t0923","佐野","85417","1963-5-21");
	line += record_gen_proc ("t0924","足利","32768","1963-5-28");
	line += record_gen_proc ("t0925","日光","94581","1963-5-14");
	line += record_gen_proc ("t0926","下野","18457","1963-3-17");
	line += record_gen_proc ("t0927","さくら","79423","1963-4-15");
	line += record_gen_proc ("t0928","矢板","13496","1963-9-14");
	line += record_gen_proc ("t0929","真岡","36426","1963-8-24");
	line += record_gen_proc ("t0930","栃木","92187","1963-7-8");
	line += record_gen_proc ("t0931","大田原","42735","1963-5-12");
	line += record_gen_proc ("t0932","鹿沼","74538","1963-9-15");
	line += record_gen_proc ("t0933","那須塩原","51823","1963-8-18");
	line += record_gen_proc ("t0934","那須烏山","79435","1963-3-29");

	return line;
}

% --------------------------------------------------------------------

%print ("*** 開始 ***");
print ("*** start ***");


print (__argv[1]);

variable file_out = __argv[1];

variable fp = fopen (file_out, "w");


variable line = "{";


line += data_prepare_proc ();

variable llx = strlen (line);
print (llx);

line = substr (line,1,llx - 2);

line += "}\n";

print (strlen (line));

fputs (line,fp);

() = fclose (fp);

print ("*** end ***");

%print ("*** 終了 ***");
% --------------------------------------------------------------------
