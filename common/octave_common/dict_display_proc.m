#
#	dict_display_proc.m
#
#					Nov/11/2014
#
# ------------------------------------------------------------------
function dict_display_proc (dict_aa)
	for [ val, key ] = dict_aa
		line_disp_proc (key,dict_aa.(key))
	endfor
endfunction
# ------------------------------------------------------------------
function line_disp_proc (key,unit_aa)
	str_out = [key,"\t",unit_aa.name,"\t",unit_aa.population,"\t",unit_aa.date_mod];
	disp (str_out);
endfunction
# ------------------------------------------------------------------
