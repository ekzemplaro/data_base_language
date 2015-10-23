-- ----------------------------------------------------
--	json_manipulate.lua
--
--					Apr/25/2011
-- ----------------------------------------------------
function json_record_out_proc (_index)
	out_str = _index .. "\t"
	out_str = out_str .. result[_index].name .. "\t"
	out_str = out_str .. result[_index].population .. "\t"
	out_str = out_str .. result[_index].date_mod
	print (out_str)
end
-- ----------------------------------------------------
function json_disp_proc (json_str)
	json = require("json")
	result = json.decode(json_str)
--	table.foreach(result,print)
	table.foreach(result,json_record_out_proc )
end
-- ----------------------------------------------------
