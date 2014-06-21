-- ----------------------------------------------------
--	tcbn_read.lua
--
--					Sep/14/2010
-- ----------------------------------------------------
file_in=arg[1]
print ("*** 開始 ***")

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
--	print (key .. ":" .. value)
	if (9 < string.len(value)) then
		json = require("json")
		obj = json.decode(value)
		out_str = key .. "\t" .. obj.name .. "\t"
		out_str = out_str .. obj.population .. "\t" .. obj.date_mod
		print (out_str)
	end
end

-- close the database
if not bdb:close() then
	ecode = bdb:ecode()
	print("close error: " .. bdb:errmsg(ecode))
end

print ("*** 終了 ***")
-- ----------------------------------------------------
