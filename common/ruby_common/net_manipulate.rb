#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	net_manipulate.rb
#
#					Jun/16/2011
#
require 'net/ftp'
#include Net
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/file_io.rb'
#
# --------------------------------------------------------------------------
def	ftp_get_proc (host,user,pass,target_file)
	work_file='/tmp/tmp00817.json'
	ftp = Net::FTP.new(host, user, pass)
	ftp.gettextfile(target_file,work_file)
	str_out=read_string_proc(work_file)
	ftp.quit
	ftp.close
	File::delete(work_file)
	return	str_out
end
# --------------------------------------------------------------------------
def	ftp_put_proc (host,user,pass,target_file,str_src)
	work_file='/tmp/tmp00923.json'
	file_write_proc(work_file,str_src)
	ftp = Net::FTP.new(host, user, pass)
	ftp.puttextfile(work_file,target_file)
	ftp.quit
	ftp.close
	File::delete(work_file)
end
# --------------------------------------------------------------------------
