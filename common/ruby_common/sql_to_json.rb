#
#	ruby_common/sql_to_json.rb
#
#					Aug/24/2011
#
# ------------------------------------------------------------------
require "rexml/document"
include REXML
#
# -----------------------------------------------------------------
def sql_to_json_proc (dbi)
#
table = dbi.select_all('select * from cities order by ID')
#
#
str_out = '{'
#
it = 0
table.each_with_index {|row,idx|
#
	str_out += '"' + row[0].to_s + '": '
	str_out += '{"name": "'+row[1]
	str_out += '","population": "' + row[2].to_s
	str_out += '","date_mod": "' + row[3].to_s + '"}'
	if (it != (table.length - 1)) then
		str_out += ','
	else
		str_out += '}'
	end
	it += 1
}
return	str_out
end
#
# -----------------------------------------------------------------
