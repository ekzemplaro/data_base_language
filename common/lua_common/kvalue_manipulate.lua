-- ----------------------------------------------------
--	kvalue_manipulate.lua
--
--					Sep/16/2010
-- ----------------------------------------------------
require('Memcached')

-- ----------------------------------------------------
function disp_proc (redis,key)
	result = redis:get (key)
	if (result ~= null) then
		json = require("json")
		obj = json.decode(result)
		out_str = key .. "\t" .. obj.name .. "\t"
		out_str = out_str .. obj.population .. "\t" .. obj.date_mod
		print (out_str)
	end
end 
-- ----------------------------------------------------
function update_proc (mem,key)
result = mem:get (key)
if (result ~= null) then
	today = (os.date ("*t").year) .. "-" ..
		(os.date ("*t").month) .. "-" ..
		(os.date ("*t").day)

	json = require("json")
	obj = json.decode(result)
	obj.population=population_in
	obj.date_mod=today
	str_json = json.encode (obj)
	print (str_json)
	mem:set (key,str_json)
end
end

-- ----------------------------------------------------
function record_out_proc (redis,id_in,name_in,population_in,date_mod_in)
	json = require("json")
	obj = {name=name_in, 
		population=population_in, date_mod=date_mod_in}
	str_json = json.encode (obj)
	print (id_in .. "\t" .. str_json)
	redis:set (id_in,str_json)
end
-- ----------------------------------------------------
