#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/postgre_create.rb
#
#					May/16/2011
# ---------------------------------------------------------------------
require 'dbi'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,'t3461',"広島",41962,"2006-3-12")
dict_aa=dict_append_proc(dict_aa,'t3462',"福山",27385,"2006-4-27")
dict_aa=dict_append_proc(dict_aa,'t3463',"東広島",58724,"2006-5-8")
dict_aa=dict_append_proc(dict_aa,'t3464',"呉",25914,"2006-1-15")
dict_aa=dict_append_proc(dict_aa,'t3465',"尾道",84721,"2006-5-21")
dict_aa=dict_append_proc(dict_aa,'t3466',"竹原",21853,"2006-4-7")
dict_aa=dict_append_proc(dict_aa,'t3467',"三次",42637,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,'t3468',"大竹",53129,"2006-8-15")
dict_aa=dict_append_proc(dict_aa,'t3469',"府中",74956,"2006-12-21")
return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
dbi=DBI.connect("dbi:Pg:city:localhost","scott","tiger")
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
dbi.disconnect
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
