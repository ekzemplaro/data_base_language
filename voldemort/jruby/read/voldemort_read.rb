#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	voldemort_read.rb
#
#					Sep/09/2013
#
#include	Java
import	java.util.HashMap
import	voldemort.client.SocketStoreClientFactory
import	voldemort.client.ClientConfig
import	voldemort.versioning.Versioned
#
#require 'rubygems'
#require 'open-uri'
#require 'json'
#
# ---------------------------------------------------------------------
#
puts	"*** 開始 ***"
#
factory = SocketStoreClientFactory(ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
client = factory.getStoreClient("cities")
#
data_aa['keys'].each {|key|
	url_city = url_base + '/' + key
	response= open(url_city,:proxy=>nil)
	str_city=response.read
	city=JSON.parse(str_city)
	print key,"\t"
	print city["name"],"\t"
	print city["population"],"\t"
	print city["date_mod"],"\n"
	}
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
