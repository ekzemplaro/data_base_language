-- ----------------------------------------------------
--	tcbn_update.lua
--
--					Nov/08/2010
-- ----------------------------------------------------
function update_proc ()
end
-- ----------------------------------------------------
print ("*** 開始 ***")
file_in=arg[1]
id_in=arg[2]
population_in=arg[3]

print (id_in,population_in)

require("tokyocabinet")

-- create the object
bdb = tokyocabinet.bdbnew()

-- open the database
if not bdb:open(file_in, bdb.OWRITER + bdb.OCREAT) then
	ecode = bdb:ecode()
	print("open error: " .. bdb:errmsg(ecode))
end

-- table-like usage
for key, value in bdb:pairs() do
	if (key == id_in) then
		json = require("json")
		result = json.decode(value)
		print (result.population)
		result.population = population_in
		print (result.population)
		today = (os.date ("*t").year) .. "-" ..
					(os.date ("*t").month) .. "-" ..
					(os.date ("*t").day)
		result.date_mod = today
		str_json = json.encode (result)
		print (str_json)
		bdb:put (key,str_json)
	end
end

-- close the database
if not bdb:close() then
	ecode = bdb:ecode()
	print("close error: " .. bdb:errmsg(ecode))
end

print ("*** 終了 ***")
-- ----------------------------------------------------
