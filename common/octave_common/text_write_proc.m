#
#	text_write_proc.m
#
#					Nov/11/2014
#
# ------------------------------------------------------------------
function text_write_proc (file_out,dict_aa)
	fid = fopen (file_out, "w");
#
	for [ val, key ] = dict_aa
		line_out_proc (fid,key,dict_aa.(key))
	endfor
#
	fclose (fid);
endfunction
# ------------------------------------------------------------------
function line_out_proc (fid,key,unit_aa)
	name = unit_aa.name;
	population = unit_aa.population;
	date_mod = unit_aa.date_mod;
	str_out = [key,"\t",name,"\t",population,"\t",date_mod,"\n"];
	fputs (fid,str_out);
endfunction
# ------------------------------------------------------------------
