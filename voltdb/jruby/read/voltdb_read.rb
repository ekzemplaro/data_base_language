#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	voltdb_read.rb
#					Jul/27/2011
#
# --------------------------------------------------------
include Java
import org.voltdb.VoltTable
import org.voltdb.VoltTableRow
import org.voltdb.client.ClientFactory
import org.voltdb.client.ClientResponse
import org.voltdb.client.Client
# --------------------------------------------------------
def get_message (myApp,id)
#	org.voltdb.client.Client myApp
	puts ("*** get_message *** " + id)
	puts "*** get_message *** aaaa ***"
	response = myApp.callProcedure("Select",id)

	puts "*** get_message *** bbbb ***"
	if (response.getStatus() != ClientResponse.SUCCESS) then
		puts response.getStatusString()
#		System.exit(-1)
	end

	puts "*** get_message *** fff ***"
	results = response.getResults()
	if (results.length != 1) then
		puts "I can't say Hello in that language."
#		System.exit(-1)
	end

	VoltTable resultTable = results[0]
	VoltTableRow row = resultTable.fetchRow(0)
	System.out.printf("%s\t%s\t%s\t%s\n",
		id,
		row.getString("name"), 
		row.getString("population"),
		row.getString("date_mod"))
end

# --------------------------------------------------------

puts "*** 開始 ***"
#org.voltdb.client.Client myApp = ClientFactory.createClient()
myApp = ClientFactory.createClient()
myApp.createConnection("localhost")

keys = ["t3951","t3952","t3953","t3954","t3955",
		"t3956","t3957","t3958","t3959"]

keys.each {|key|
	get_message(myApp,key)
	}

puts "*** 終了 ***"

# --------------------------------------------------------
