#! /usr/bin/ruby
#
#	oracle_create.rb
#
#				May/31/2010
#
# ------------------------------------------------------------
require 'rubygems'
require 'oci8'
require 'date'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ------------------------------------------------------------
def prepare_data_proc ()
dict_aa = {}
dict_aa=dict_append_proc(dict_aa,"t0131","函館",71962,"2006-3-14")
dict_aa=dict_append_proc(dict_aa,"t0132","札幌",84275,"2006-4-27")
dict_aa=dict_append_proc(dict_aa,"t0133","帯広",62842,"2006-5-8")
dict_aa=dict_append_proc(dict_aa,"t0134","釧路",25954,"2006-1-15")
dict_aa=dict_append_proc(dict_aa,"t0135","旭川",84148,"2006-5-21")
dict_aa=dict_append_proc(dict_aa,"t0136","北見",21581,"2006-9-7")
dict_aa=dict_append_proc(dict_aa,"t0137","室蘭",42692,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,"t0138","根室",54872,"2006-8-12")
dict_aa=dict_append_proc(dict_aa,"t0139","稚内",72691,"2006-6-9")
return dict_aa
end

# ------------------------------------------------------------
def	table_drop_proc (dbi)
#
cur = dbi.exec('drop table cities')
end
# ------------------------------------------------------------
def	table_create_proc (dbi)
#
sql_str="create TABLE cities (" \
	+ "id varchar(10) NOT NULL PRIMARY KEY," \
	+ "name varchar(20)," \
	+ "population int," \
	+ "date_mod date)"

cur = dbi.exec(sql_str)
end
# ------------------------------------------------------------
def	table_insert_proc (dbi,id,name,population,date_mod)
	sql_str="INSERT into cities " \
		+ "(id, name, population, date_mod) values \
		('#{id}', '#{name}',#{population},'#{date_mod}')"
#puts sql_str
	dbi.exec(sql_str)
end

# ------------------------------------------------------------
def	table_disp_proc (dbi)
#
cur = dbi.exec('select * from cities')
while   row = cur.fetch
	puts row.join("\t")
end
end
#
# ------------------------------------------------------------
puts	"*** 開始 ***"
#
dict_aa=prepare_data_proc()
#
dbi=OCI8.new('scott', 'tiger', '//spn109:1521/xe')
#
table_drop_proc(dbi)
table_create_proc(dbi)
#
dict_aa.each {|key,value |
	table_insert_proc(dbi,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
dbi.commit()
#
table_disp_proc (dbi)
#
puts	"*** 終了 ***"
#
# ------------------------------------------------------------
