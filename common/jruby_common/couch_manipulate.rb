# -*- encoding: utf-8 -*-
#
#	jruby_common/couch_manipulate.rb
#
#					Apr/26/2011
#
require 'json'
#
# ---------------------------------------------------------------------
def couch_delete_proc (server)
#
str_list = server.get("/city/_all_docs")
puts str_list.body
list_aa=JSON.parse(str_list.body)
puts "*** check bbbbb ***"
puts list_aa["total_rows"]
puts list_aa["offset"]


list_aa["rows"].each do |row|
	if (row["id"] == "cities") then 
		puts row["id"] + "\t" + row["value"]["rev"]
		server.delete("/city/cities?rev=" + row["value"]["rev"])
	end
end

end
# ---------------------------------------------------------------------
