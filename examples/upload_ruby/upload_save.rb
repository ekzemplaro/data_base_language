#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	upload_save.rb
#
#					Feb/07/2014
#
# --------------------------------------------------------------------
require "cgi"
# --------------------------------------------------------------------
form = CGI.new
print "Content-type: text/html\n\n"
print "Now Uploading...<br />"
print form.keys
print "<br />"
print form.params
print "<br />"
print "*** aaaa ***<br />"
print form['files']
print "<br />"
print form['files'].length
print "<br />"
print form['files'].class.to_s + "<br>"
print form['files'].original_filename + "<br>"
#
#
output_dir = "/tmp"
open(output_dir + "/" + form['files'].original_filename, "w") {|fh|
	fh.write form['files'].read
}
#
print "Upload End"
# --------------------------------------------------------------------
