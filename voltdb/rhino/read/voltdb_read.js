#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------------
/*
	voltdb_read.js

						Jul/23/2011
*/
// --------------------------------------------------------------------
importPackage (org.voltdb);
importPackage (org.voltdb.client);

// --------------------------------------------------------------------
print ("*** 開始 ***");
var myApp = ClientFactory.createClient();
myApp.createConnection("localhost");

var keys = ["t3951","t3952","t3953","t3954","t3955",
		"t3956","t3957","t3958","t3959"];

for (var it in keys)
	{
	var key = keys[it];
	get_message (myApp,key);
	}

print ("*** 終了 ***");

// --------------------------------------------------------------------
function get_message (myApp,id)
{
//	System.out.println ("*** get_message ***" + id)
	var response = myApp.callProcedure("Select",id);
	if (response.getStatus() != ClientResponse.SUCCESS){
		print (response.getStatusString());
		System.exit(-1);
	}

	var results = response.getResults();
	if (results.length != 1) {
		print ("I can't say Hello in that language.");
		System.exit(-1);
	}

	var resultTable = results[0];
	var row = resultTable.fetchRow(0);
	var out_str = id + "\t" + row.getString("name");
	out_str += "\t" + row.getString("population");
	out_str += "\t" + row.getString("date_mod");
	print (out_str)
}

// --------------------------------------------------------------------
