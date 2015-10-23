-- ----------------------------------------------------
--	tcbn_delete.lua
--
--					Sep/14/2010
-- ----------------------------------------------------
print ("*** 開始 ***")
file_in=arg[1]
id_in=arg[2]

print (id_in)

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
		bdb:out (key)
	end
end

-- close the database
if not bdb:close() then
	ecode = bdb:ecode()
	print("close error: " .. bdb:errmsg(ecode))
end

print ("*** 終了 ***")
-- ----------------------------------------------------
