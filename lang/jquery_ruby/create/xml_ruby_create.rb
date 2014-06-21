#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	xml_ruby_create.rb
#
#					May/16/2011
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
# -------------------------------------------------------------
def doc_prepare_proc ()
	doc_out = REXML::Document.new()
	doc_out.add(REXML::XMLDecl.new(version="1.0", encoding="UTF-8"))
#
	root_element = REXML::Element.new("root")
	doc_out.add_element(root_element)
#
	add_row_proc(root_element,"t2261","静岡",71400,"2006-7-16")
	add_row_proc(root_element,"t2262","浜松",45300,"2006-1-3")
	add_row_proc(root_element,"t2263","沼津",28800,"2006-5-25")
	add_row_proc(root_element,"t2264","三島",82900,"2006-10-8")
	add_row_proc(root_element,"t2265","富士",91500,"2006-3-19")
	add_row_proc(root_element,"t2266","熱海",98500,"2006-2-11")
	add_row_proc(root_element,"t2267","富士宮",72500,"2006-12-19")
	add_row_proc(root_element,"t2268","藤枝",52700,"2006-11-27")
	add_row_proc(root_element,"t2269","御殿場",14900,"2006-9-2")
	add_row_proc(root_element,"t2270","島田",43500,"2006-10-21")
#
	return	doc_out
#
end
# -------------------------------------------------------------
xml_file = "/var/tmp/xml_file/cities.xml"
#
puts "Content-type: text/html\n\n"
#
doc_out=doc_prepare_proc()
#
File.open(xml_file,"w") do |outfile|
	doc_out.write(outfile)
end
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
