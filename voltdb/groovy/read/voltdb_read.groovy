// --------------------------------------------------------------------
/*
	voltdb_read.groovy

						Jul/09/2011
*/
// --------------------------------------------------------------------
import org.voltdb.VoltTable
import org.voltdb.VoltTableRow
import org.voltdb.client.ClientFactory
import org.voltdb.client.ClientResponse

// --------------------------------------------------------------------
class voltdb_read {

// --------------------------------------------------------------------
static void main(args) throws Exception
{
	println ("*** 開始 ***")
	org.voltdb.client.Client myApp
	myApp = ClientFactory.createClient()
	myApp.createConnection("localhost")

	def keys = ["t3951","t3952","t3953","t3954","t3955",
		"t3956","t3957","t3958","t3959"]

	for (key in keys)
		{
		get_message (myApp,key)
		}

	println ("*** 終了 ***")
}

// --------------------------------------------------------------------
static get_message (org.voltdb.client.Client myApp,String id)
throws Exception
{
//	System.out.println ("*** get_message ***" + id)
	def response = myApp.callProcedure("Select",id)
	if (response.getStatus() != ClientResponse.SUCCESS){
		System.err.println(response.getStatusString())
		System.exit(-1)
	}

	def results = response.getResults()
	if (results.length != 1) {
		System.out.printf("I can't say Hello in that language.")
		System.exit(-1)
	}

	VoltTable resultTable = results[0]
	VoltTableRow row = resultTable.fetchRow(0)
	System.out.printf("%s\t%s\t%s\t%s\n",
		id,
		row.getString("name"), 
		row.getString("population"),
		row.getString("date_mod"))
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
