#! /usr/bin/ruby
#
#	oracle_update.rb
#
#				May/31/2011
#
require 'rubygems'
require 'oci8'
require 'date'
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
def	update_proc (dbi,id,population)
date_mod=Date.today
#date_mod=Time.now
#puts date_mod
sql_str="UPDATE cities SET population='#{population}', DATE_MOD='#{date_mod}' where ID = '#{id}'"
dbi.exec(sql_str)
end
# ------------------------------------------------------------
puts	"*** 開始 ***"
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
dbi=OCI8.new('scott', 'tiger', '//spn109:1521/xe')
#
update_proc(dbi,id_in,population_in)
dbi.commit()
#
disp_proc (dbi)
#
puts	"*** 終了 ***"
#
# ------------------------------------------------------------
