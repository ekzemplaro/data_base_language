#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/maria_create.rb
#
#					Sep/16/2013
# ---------------------------------------------------------------------
require 'dbi'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa = {}
dict_aa=dict_append_proc(dict_aa,'t3321',"岡山",629138,"2006-9-14")
dict_aa=dict_append_proc(dict_aa,'t3322',"倉敷",328475,"2006-2-27")
dict_aa=dict_append_proc(dict_aa,'t3323',"津山",182564,"2006-8-8")
dict_aa=dict_append_proc(dict_aa,'t3324',"玉野",572148,"2006-11-15")
dict_aa=dict_append_proc(dict_aa,'t3325',"笠岡",893157,"2006-7-21")
dict_aa=dict_append_proc(dict_aa,'t3326',"井原",167589,"2006-9-7")
dict_aa=dict_append_proc(dict_aa,'t3327',"総社",241937,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,'t3328',"高梁",438129,"2006-10-12")
dict_aa=dict_append_proc(dict_aa,'t3329',"新見",519472,"2006-6-9")
	return	dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
dbi=DBI.connect("dbi:Mysql:city:localhost","scott","tiger")
#
mysql_utf8_proc(dbi)
#
dict_aa=prepare_data_proc()
#
sss = Sql_manipulate.new
sss.drop_proc(dbi)
sss.create_proc(dbi)
#
dict_aa.each {|key,value |
	sss.insert_proc(dbi,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
sss.disp_proc(dbi)
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
