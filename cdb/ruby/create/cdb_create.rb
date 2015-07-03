#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	cdb_create.rb
#
#						Jun/25/2015
#
require 'fileutils'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cdb_manipulate.rb'
# ------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2761","豊中",62841,"2006-6-15")
	dict_aa=dict_append_proc(dict_aa,"t2762","池田",84937,"2006-8-28")
	dict_aa=dict_append_proc(dict_aa,"t2763","高槻",51829,"2006-2-9")
	dict_aa=dict_append_proc(dict_aa,"t2764","吹田",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t2765","茨木",84193,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t2766","摂津",21589,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t2767","泉大津",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t2768","和泉",54136,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t2769","高石",78325,"2006-10-27")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts "*** 開始 ***"
#
file_cdb = ARGV[0]
#
dict_aa = data_prepare_proc()
#
cdb_write_proc(file_cdb,dict_aa)
#
puts "*** 終了 ***"
# ------------------------------------------------------------

