#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby_common/json_manipulate.rb
#
#					Mar/22/2012
#
#require 'rubygems'
require 'json'
#
# ---------------------------------------------------------------------
def json_gen_proc (name_in,population_in,date_mod_in)
	data = {}
	data["name"]=name_in
	data["population"]=population_in
	data["date_mod"]=date_mod_in
#
	json_str = JSON.generate(data)
#
	return	json_str
end
# ---------------------------------------------------------------------
