-- ----------------------------------------------------
--	xml_manipulate.lua
--
--					May/27/2011
-- ----------------------------------------------------
require('LuaXml')

-- ----------------------------------------------------
function xml_string_display (xml_str)
	local xfile = xml.eval(xml_str)

	print	(#xfile)

	for it = 1, #xfile do
		xml_record_parser (xfile[it])
	end
end
-- ----------------------------------------------------
function xml_record_parser (data_in)
	local id_aa = xml.tag (data_in)
	local name_aa = data_in:find("name")[1]
	local population_aa = data_in:find("population")[1]
	local date_mod_aa = data_in:find("date_mod")[1]
	print (id_aa,name_aa,population_aa,date_mod_aa)
end

-- ----------------------------------------------------
function xml_to_dict_proc (str_xml)
	dict_aa = {}
	local xfile = xml.eval(str_xml)
	for it = 1, #xfile do
		data_aa=xfile[it]
		local id_aa = xml.tag (data_aa)
		local name_aa = data_aa:find("name")[1]
		local population_aa = data_aa:find("population")[1]
		local date_mod_aa = data_aa:find("date_mod")[1]
		dict_append_proc (dict_aa,id_aa,name_aa,population_aa,date_mod_aa)
	end
	return	dict_aa
end
-- ----------------------------------------------------
function tag_str_gen (tag,value)
	str_out = "<" .. tag .. ">"
	str_out2 = "</" .. tag .. ">"
	str_out = str_out .. value .. str_out2
	return str_out
end
-- ----------------------------------------------------
function dict_to_xml_proc (dict_aa)
	out_str = ""
	for str_key in pairs (dict_aa)
		do
			if ((str_key ~= "_id") and (str_key ~= "_rev")) then
			if (dict_aa[str_key]) then
				name = dict_aa[str_key]["name"]
				str_name = tag_str_gen ("name",name)
				population = dict_aa[str_key]["population"]
				str_population = tag_str_gen ("population",population)
				date_mod = dict_aa[str_key]["date_mod"]
				str_date_mod = tag_str_gen ("date_mod",date_mod)
				str_all = str_name .. str_population .. str_date_mod
				out_str = out_str .. tag_str_gen (str_key,str_all)
	
			end
			end
		end
	out_str = tag_str_gen ("root",out_str)
	out_str = "<?xml version=\"1.0\"?>\n" .. out_str
--	print (out_str)

	return	out_str
end
-- ----------------------------------------------------
