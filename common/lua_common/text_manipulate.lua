-- ----------------------------------------------------
--	text_manipulate.lua
--
--					Dec/15/2014
-- ----------------------------------------------------
function split_proc (str, del)
	p, nrep = str:gsub("%s*"..del.."%s*", "")
	return { str:match((("%s*(.-)%s*"..del.."%s*"):rep(nrep).."(.*)")) } 
end 
-- ----------------------------------------------------
function join_proc (doc_aa,id,delimit)
	name = doc_aa[id]["name"]
	population = doc_aa[id]["population"]
	date_mod = doc_aa[id]["date_mod"]
	out_str = id .. delimit
		.. name .. delimit
		.. population .. delimit
		.. date_mod
	return	out_str
end
-- ----------------------------------------------------
function get_keys_sorted_proc (tbl)
	local keys = {}
	for key in pairs(tbl) do
		table.insert(keys, key)
	end

	table.sort (keys)

	return keys
end

-- ----------------------------------------------------
function dict_display_proc (dict_in)
	keys = get_keys_sorted_proc (dict_in)
	for num,value in pairs (keys)
		do
			if ((value ~= "_id") and (value ~= "_rev")) then
			if (dict_in[value]) then
				out_str = join_proc (dict_in,value,"\t")
				print (out_str)
			end
			end
		end
end
-- ----------------------------------------------------
function text_read_proc (file_in)
	fp_in, msg=io.open (file_in,"r")

	doc_aa = {}

	if (fp_in) then
		tt = fp_in:read ("*a")
		fp_in:close ()
		lines=split_proc (tt, "\n")
		for it=1 , #lines do
			rr=split_proc (lines[it], "\t")
			if (2 < #rr) then
				doc_aa[rr[1]] =
				 {name= rr[2],population=rr[3],date_mod=rr[4]}
			end
		end
	else
		print (msg)
	end

	return	doc_aa
end

-- ----------------------------------------------------
function text_write_proc (file_out,dict_in)
	io.output (file_out)
	for str_key in pairs (dict_in)
		do
			if (dict_in[str_key]) then
				out_str = join_proc (dict_in,str_key,"\t") .. "\n"
				io.write (out_str)
			end
		end
end
-- ----------------------------------------------------
function dict_update_proc (dict_in,id_in,population_in)
	str_key = tostring (id_in)

	if (dict_in[str_key]) then
		dict_in[str_key]["population"] = population_in
		dict_in[str_key]["date_mod"] = get_current_date_proc ()
	end

	return	dict_in
end
-- ----------------------------------------------------
function dict_delete_proc (dict_in,id_in)
	str_key = tostring (id_in)

	if (dict_in[str_key]) then
		dict_in[str_key] = nil
	end

	return	dict_in
end
-- ----------------------------------------------------
function dict_append_proc (dict_aa,id_in,name_in,population_in,date_mod_in)
	unit_aa = {name=name_in,population=population_in,date_mod=date_mod_in}
	dict_aa[id_in] = unit_aa 
	return dict_aa
end
-- ----------------------------------------------------
function csv_read_proc (file_in)
	fp_in, msg=io.open (file_in,"r")

	doc_aa = {}

	if (fp_in) then
		tt = fp_in:read ("*a")
		fp_in:close ()
		lines=split_proc (tt, "\n")
		for it=1 , #lines do
			rr=split_proc (lines[it], ",")
			if (2 < #rr) then
				doc_aa[rr[1]] =
				 {name= rr[2],population=rr[3],date_mod=rr[4]}
			end
		end
	else
		print (msg)
	end

	return	doc_aa
end

-- ----------------------------------------------------
function csv_write_proc (file_out,dict_in)
	io.output (file_out)
	for str_key in pairs (dict_in)
		do
			if (dict_in[str_key]) then
				out_str = join_proc (dict_in,str_key,",") .. "\n"
				io.write (out_str)
			end
		end
end
-- ----------------------------------------------------
function get_current_date_proc ()
	today = (os.date ("*t").year) .. "-" ..
		(os.date ("*t").month) .. "-" ..
		(os.date ("*t").day)
--
	return	today
end
-- ----------------------------------------------------
