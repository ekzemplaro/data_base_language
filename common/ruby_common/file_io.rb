#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby_common/file_io.rb
#
#					Apr/25/2011
#
#require 'rubygems'
#require 'json'
#require 'date'
#
# ---------------------------------------------------------------------
def read_string_proc (file_in)
#
	str_out=""
	File.open(file_in,"r") do |ff|
		while line=ff.gets
			str_out += line
		end
	end
#
	return	str_out
end
# ---------------------------------------------------------------------
def file_write_proc (file_out,str_out)
	File.open(file_out,"w") do |fp_out|
		fp_out.puts str_out
	end
#		
end
# ---------------------------------------------------------------------
