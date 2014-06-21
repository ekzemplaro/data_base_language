#! /usr/bin/ruby
#
#	oracle_delete.rb
#
#				May/31/2010
#
require 'rubygems'
require 'oci8'
#
# ------------------------------------------------------------
def	disp_proc (dbi)
#
cur = dbi.exec('select * from cities')
while   row = cur.fetch
	puts row.join("\t")
end
end
#
# ------------------------------------------------------------
def	delete_proc (dbi,id)
sql_str="DELETE from cities where ID = '#{id}'"
dbi.exec(sql_str)
end
# ------------------------------------------------------------
puts	"*** 開始 ***"
id_in = ARGV[0]
#
puts id_in
#
dbi=OCI8.new('scott', 'tiger', '//spn109:1521/xe')
#
delete_proc(dbi,id_in)
dbi.commit()
#
disp_proc (dbi)
#
puts	"*** 終了 ***"
#
# ------------------------------------------------------------
