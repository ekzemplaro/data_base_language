#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby_common/xml_manipulate.rb
#
#					May/16/2011
#
# -----------------------------------------------------------------
require "rexml/document"
include REXML
#
# -----------------------------------------------------------------
def dict_to_xml_proc (dict_aa)
	doc_out = REXML::Document.new()
	doc_out.add(REXML::XMLDecl.new(version="1.0", encoding="UTF-8"))
#
	root_element = REXML::Element.new("root")
	doc_out.add_element(root_element)
#
	dict_aa.each {|key, value|
		add_row_proc(root_element,key,value['name'],
			value['population'],value['date_mod'])
		}
#
	return	doc_out.to_s
#
end
# -----------------------------------------------------------------
def add_row_proc (root_element,id_in,name_in,population_in,date_mod_in)
	cities_element = REXML::Element.new(id_in)
	root_element.add_element(cities_element)
#
	name_aa = REXML::Element.new("name")
	cities_element.add_element(name_aa)
	name_aa.add_text(name_in)
#
	population_aa = REXML::Element.new("population")
	cities_element.add_element(population_aa)
	population_aa.add_text(population_in.to_s)
#
	date_mod_aa = REXML::Element.new("date_mod")
	cities_element.add_element(date_mod_aa)
	date_mod_aa.add_text(date_mod_in.to_s)
#
end
# -----------------------------------------------------------------
def xml_to_dict_proc (xml_str)
	xml_str = xml_str.gsub("\n","")
	xml_str = xml_str.strip
	xml_str = xml_str.gsub(" ","")
	dict_aa = {}
	doc = Document.new(xml_str,{:compress_whitespace =>:all})
	cities=doc.root.to_a
#
	count = 0
	for node in cities do
		unit_aa = {}
		unit_aa['name'] = node.elements["name"].text
		unit_aa['population'] = node.elements["population"].text
		unit_aa['date_mod'] = node.elements["date_mod"].text
		key = node.name
		dict_aa[key]=unit_aa
	end	
	return	dict_aa
end
# -----------------------------------------------------------------
def xml_to_json_proc (xml_str_in)
#
#puts xml_str_in
#
doc = Document.new xml_str_in
#
str_out = '{'
cities=doc.root.elements.to_a("//cities")
#
for it in 0..(cities.length-1) do
#
	city=cities[it]
	str_out += '"'+city.elements["id"].text + '"'
	str_out += '"name": "'+city.elements["name"].text
	str_out += '","population": "' + city.elements["population"].text
	str_out += '","date_mod": "' + city.elements["date_mod"].text + '"}'
	if (it != (cities.length - 1)) then
		str_out += ','
	else
		str_out += '}'
	end
end
#
return	str_out
end
# -----------------------------------------------------------------
