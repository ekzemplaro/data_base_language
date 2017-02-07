// --------------------------------------------------------------------
/*
	voltdb_read.scala

						Jul/23/2011
*/
// --------------------------------------------------------------------
import org.voltdb.VoltTable
import org.voltdb.VoltTableRow
import org.voltdb.client.ClientFactory
import org.voltdb.client.ClientResponse

// --------------------------------------------------------------------
object voltdb_read {

// --------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")
//	org.voltdb.client.Client myApp = ClientFactory.createClient()
	val myApp = ClientFactory.createClient()
	myApp.createConnection("localhost")

	val keys = Array ("t3951","t3952","t3953","t3954","t3955",
		"t3956","t3957","t3958","t3959")

	for (key <- keys)
		{
		get_message (myApp,key)
		}

	println ("*** 終了 ***")
}

// --------------------------------------------------------------------
def get_message (myApp: org.voltdb.client.Client,id: String)
{
//	println ("*** get_message ***" + id)
	val response = myApp.callProcedure("Select",id)
	if (response.getStatus() != ClientResponse.SUCCESS){
		System.err.println(response.getStatusString())
		System.exit(-1)
	}

	val results = response.getResults()
	if (results.length != 1) {
		System.out.printf("I can't say Hello in that language.")
		System.exit(-1)
	}

	val resultTable = results(0)
	val row = resultTable.fetchRow(0)
	System.out.printf("%s\t%s\t%s\t%s\n",
		id,
		row.getString("name"), 
		row.getString("population"),
		row.getString("date_mod"))
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
