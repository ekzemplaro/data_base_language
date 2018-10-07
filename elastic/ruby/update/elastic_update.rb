#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/update/elastic_update.rb
#
#					Oct/07/2018
#
# ---------------------------------------------------------------------
require 'faraday'
require 'json'
require 'date'
#
# ---------------------------------------------------------------------
STDERR.puts	"*** 開始 ***"
key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in
#
URL = "http://localhost:9200/cities/tochigi/" + key_in + "/_update"
puts URL
#
str_date_mod = Date.today
#
args = {}
args['script'] = {}
args['script']['source'] = "ctx._source.population = params.population; ctx._source.date_mod = params.date_mod"

args['script']['lang'] = "painless"
args['script']['params'] = {}
args['script']['params']['population'] = population_in
args['script']['params']['date_mod'] = str_date_mod
#
puts args["script"]['params']['population']
puts args["script"]['params']['date_mod']
#
con = Faraday.new 
res = con.post do |req|
    req.url URL
    req.headers['Content-Type'] = 'application/json'
    req.body = JSON.pretty_generate(args)
end
#
STDERR.puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
