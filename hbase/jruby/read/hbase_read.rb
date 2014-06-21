#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	hbase_read.rb
#					Dec/04/2013
#
# --------------------------------------------------------
include	Java
import  java.io.IOException

import org.apache.hadoop.conf.Configuration
import org.apache.hadoop.fs.Path
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.Get
import org.apache.hadoop.hbase.client.HTableInterface
import org.apache.hadoop.hbase.client.Result
import org.apache.hadoop.hbase.client.HTableFactory
import org.apache.hadoop.hbase.util.Bytes


import org.apache.log4j.PropertyConfigurator

import java.lang.System
# --------------------------------------------------------
def get_row_proc (table,key_in)
#	gg = new Get(Bytes.toBytes(key_in))
#	rr = table.get(gg)

#	value_name = rr.getValue(Bytes.toBytes("name"),new byte[0])
#	str_name = Bytes.toString(value_name)

#	value_population = rr.getValue(Bytes.toBytes("population"),new byte[0])
#	str_population = Bytes.toString(value_population)

#	value_date_mod = rr.getValue(Bytes.toBytes("date_mod"),new byte[0])
#	str_date_mod = Bytes.toString(value_date_mod)

	out_str = key_in + "\t"
#	out_str = key_in + "\t" + str_name + "\t" + str_population + "\t" + str_date_mod
	System.out.println(out_str)
end

# --------------------------------------------------------
puts("*** 開始 ***")
#
conf = HBaseConfiguration.create()

#factory = new HTableFactory()
#factory = new HTableFactory()
factory = HTableFactory()
table = factory.createHTableInterface(conf, Bytes.toBytes("cities"))

table="aaa"
get_row_proc(table,"t1671")
get_row_proc(table,"t1672")
get_row_proc(table,"t1673")
get_row_proc(table,"t1674")
get_row_proc(table,"t1675")
get_row_proc(table,"t1676")
get_row_proc(table,"t1677")
get_row_proc(table,"t1678")
get_row_proc(table,"t1679")

puts("*** 終了 ***")
# --------------------------------------------------------
