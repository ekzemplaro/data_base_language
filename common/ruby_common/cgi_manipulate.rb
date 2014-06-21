#! /usr/bin/ruby
#
#	cgi_manipulate.rb
#
#					May/06/2011
#
require	"cgi"
require	"json"
#
# ---------------------------------------------------------------------
def	parse_parameter	()
	$cgi=CGI.new
	json_str=$cgi["my_data"]
#
	print "json_str = " + json_str + "<p />"
#	jxx = Json_manipulate.new
	hhh_aa=JSON.parse(json_str)
	return hhh_aa
end
# ---------------------------------------------------------------------
