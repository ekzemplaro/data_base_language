#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	create/xindice_create.rb
#
#					May/19/2011
#
# ------------------------------------------------------------
include	Java
import	java.lang.System
#
require "rexml/document"
include REXML
require	"net/http"
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# ------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t0271","青森",82127,"2007-4-15")
	dict_aa=dict_append_proc(dict_aa,"t0272","弘前",29819,"2007-7-27")
	dict_aa=dict_append_proc(dict_aa,"t0273","八戸",51672,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t0274","三沢",27365,"2007-1-21")
	dict_aa=dict_append_proc(dict_aa,"t0275","黒石",84141,"2007-5-24")
	dict_aa=dict_append_proc(dict_aa,"t0276","むつ",21581,"2007-3-7")
	dict_aa=dict_append_proc(dict_aa,"t0277","五所川原",42693,"2007-11-8")
	dict_aa=dict_append_proc(dict_aa,"t0278","十和田",54197,"2007-8-15")
	dict_aa=dict_append_proc(dict_aa,"t0279","平川",74526,"2007-10-27")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts	"*** 開始 *** exist_create.rb ***"
System.out.println("*** 開始 ***")
#
dict_aa=prepare_data_proc()
dict_display_proc(dict_aa)
#
str_xml=dict_to_xml_proc(dict_aa)
#
collections="cities"
xml_file="cities"
path="/xindice/db/" + collections + "/" + xml_file
host= "host_dbase"
port = 8888
#
Net::HTTP.start(host,port)do |http|
		http.put(path,str_xml)
#		contents=http.get(path)
#		print contents.body
#		dict_aa=xml_to_dict_proc(contents.body)
#		dict_display_proc(dict_aa)
	end
#
#exist_send_proc(host,port,doc_out,path)
#
puts	"*** 終了 *** xml_create.rb ***"
System.out.println("*** 終了 ***")
#
# ------------------------------------------------------------
