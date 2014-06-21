#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	cassandra_create.rb
#
#						Jun/19/2013
require 'rubygems'
require 'cassandra'
include Cassandra::Constants
#
load '/var/www/data_base/common/ruby_common/cassandra_manipulate.rb'
# -------------------------------------------------------------------
def insert_proc (cities,id,name_in,population_in,date_mod_in)
	name = {'name' => name_in}
	population = {'population' => population_in}
	date_mod = {'date_mod' => date_mod_in}
	cities.insert(:Akita, id, name)
	cities.insert(:Akita, id, population)
	cities.insert(:Akita, id, date_mod)
end
# -------------------------------------------------------------------
def	data_create_proc (cities)
	insert_proc(cities,'t0531','秋田','45649','2006-2-1')
	insert_proc(cities,'t0532','男鹿','87216','2006-4-9')
	insert_proc(cities,'t0533','由利本荘','54726','2006-5-5')
	insert_proc(cities,'t0534','横手','27856','2006-8-15')
	insert_proc(cities,'t0535','鹿角','18357','2006-7-14')
	insert_proc(cities,'t0536','大館','51398','2006-9-21')
	insert_proc(cities,'t0537','能代','13659','2006-10-28')
	insert_proc(cities,'t0538','にかほ','72451','2006-12-08')
	insert_proc(cities,'t0539','湯沢','93452','2006-2-21')
end
# -------------------------------------------------------------------
puts "*** 開始 ***"
cities = Cassandra.new('Cities')
#
data_create_proc(cities)
#
#
cassandra_display_proc (cities)
#
puts "*** 終了 ***"
