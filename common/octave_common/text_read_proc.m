#
#	text_read_proc.m
#
#					Nov/11/2014
#
# ------------------------------------------------------------------
function dict_aa = text_read_proc (file_in)
	fid = fopen (file_in, "r")
	while (! feof (fid) )
		text_line = fgetl (fid);
		[key name population date_mod] = strsplit (text_line){1,:};
		unit_aa.name = name;
		unit_aa.population = population;
		unit_aa.date_mod = date_mod;
		dict_aa.(key) = unit_aa;
	endwhile
#
	fclose (fid)
#
endfunction
# ------------------------------------------------------------------
