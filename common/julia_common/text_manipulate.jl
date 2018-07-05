#
#	text_manipulate.jl
#
#					Jul/05/2018
# --------------------------------------------------------------------
function text_to_dict_proc(fname_in)
	delimiter = "\t"
	dict_aa = text_to_dict_proc_exec(delimiter,fname_in)
#
	return	dict_aa
end
# --------------------------------------------------------------------
function text_to_dict_proc_exec(delimiter,fname_in)
	string = open(readstring, fname_in, "r")
	lines = split(string,"\n")
#
	dict_aa = Dict()
	llx = length(lines)
	println(llx)
	for it=1:llx
		line = lines[it]
		if (1 < length(line))
			cols = split(line,delimiter)
			key = cols[1]
			K = ["name","population","date_mod"]
			V = [cols[2],cols[3],cols[4]]
#			unit_aa = Dict(K,V)
			unit_aa = Dict("name" => cols[2],"population" => cols[3], "date_mod" => cols[4])
			dict_aa[key] = unit_aa
		end
	end
#
	return	dict_aa
end
# --------------------------------------------------------------------
function dict_display_proc(dict_aa)
#
	for key in sort(collect(keys(dict_aa)))
		print(key, '\t', dict_aa[key]["name"])
		print('\t', dict_aa[key]["population"])
		println('\t', dict_aa[key]["date_mod"])
	end

end
# --------------------------------------------------------------------
function dict_append_proc(dict_aa,key,name,population,date_mod)
	K = ["name","population","date_mod"]
	V = [name,population,date_mod]
#	unit_aa = Dict(K,V)
	unit_aa = Dict("name" => name,"population" => population, "date_mod" => date_mod)
	dict_aa[key] = unit_aa
#
	return	dict_aa
end
# --------------------------------------------------------------------
function dict_to_text_proc(dict_aa,fname_out)
	delimiter = "\t"
	dict_to_text_proc_exec(delimiter,dict_aa,fname_out)
#
end
#
# --------------------------------------------------------------------
function dict_to_text_proc_exec(delimiter,dict_aa,fname_out)
	fp_out = open(fname_out,"w")
#
	for key in sort(collect(keys(dict_aa)))
		str_out = string(key,delimiter,dict_aa[key]["name"])
		str_out = string(str_out,delimiter,dict_aa[key]["population"])
		str_out = string(str_out,delimiter,dict_aa[key]["date_mod"])
		str_out = string(str_out,'\n')
		write(fp_out,str_out)
	end
#
	close(fp_out)
end
#
# --------------------------------------------------------------------
function dict_update_proc(dict_aa,key,population_in)
#
	today = Libc.strftime("%F", time())
#
	unit_aa = Dict()
	unit_aa["name"] = dict_aa[key]["name"]
	unit_aa["population"] = population_in
	unit_aa["date_mod"] = today
	dict_aa[key] = unit_aa
#
	return	dict_aa
end
#
# --------------------------------------------------------------------
function csv_to_dict_proc(fname_in)
	delimiter = ","
	dict_aa = text_to_dict_proc_exec(delimiter,fname_in)
#
	return	dict_aa
end
# --------------------------------------------------------------------
function dict_to_csv_proc(dict_aa,fname_out)
	delimiter = ","
	dict_to_text_proc_exec(delimiter,dict_aa,fname_out)
#
end
#
# --------------------------------------------------------------------
