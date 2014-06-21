#! /usr/bin/slsh
%
%	xml_create.sl
%
%					Aug/30/2013
% --------------------------------------------------------------------
require ("cmdopt");

% --------------------------------------------------------------------
define tag_out_proc (tag,value )
{
	variable out_str = "\t<" + tag + ">";

	out_str += value;

	out_str += "</" + tag + ">\n";

	return out_str;
}

% --------------------------------------------------------------------
define record_gen_proc (id,name,population,date_mod)
{
	variable out_str = "<";
	out_str += id;
	out_str += ">";
	out_str += tag_out_proc ("id",id);
	out_str += tag_out_proc ("name",name);
	out_str += tag_out_proc ("population",population);
	out_str += tag_out_proc ("date_mod",date_mod);
	out_str += "</";
	out_str += id;
	out_str += ">";

	return out_str;
}

% --------------------------------------------------------------------
define data_prepare_proc ()
{
	variable line = record_gen_proc ("t2261","静岡","32591","1963-9-30");
	line += record_gen_proc ("t2262","浜松","24986","1963-10-12");
	line += record_gen_proc ("t2263","沼津","81327","1963-5-21");
	line += record_gen_proc ("t2264","三島","32751","1963-7-28");
	line += record_gen_proc ("t2265","富士","94562","1963-8-14");
	line += record_gen_proc ("t2266","熱海","52417","1963-3-17");
	line += record_gen_proc ("t2267","富士宮","29461","1963-4-15");
	line += record_gen_proc ("t2268","藤枝","73458","1963-9-14");
	line += record_gen_proc ("t2269","御殿場","32476","1963-8-24");
	line += record_gen_proc ("t2270","島田","92487","1963-7-8");


	return line;
}

% --------------------------------------------------------------------

%print ("*** 開始 ***");
print ("*** start ***");


print (__argv[1]);

variable file_out = __argv[1];

variable fp = fopen (file_out, "w");


variable line = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
line += "<root>\n";

line += data_prepare_proc ();

line += "</root>\n";
fputs (line,fp);

() = fclose (fp);


print ("*** end ***");

%print ("*** 終了 ***");
