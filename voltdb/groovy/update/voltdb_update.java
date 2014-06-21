// --------------------------------------------------------------------
/*
	voltdb_update.java

						Jul/09/2011
*/
// --------------------------------------------------------------------
import org.voltdb.VoltTable;
import org.voltdb.VoltTableRow;
import org.voltdb.client.ClientFactory;
import org.voltdb.client.ClientResponse;

// --------------------------------------------------------------------
public class voltdb_update {

// --------------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	org.voltdb.client.Client myApp;
	myApp = ClientFactory.createClient();
	myApp.createConnection("localhost");


	get_message (myApp,key);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------------
static void get_message (org.voltdb.client.Client myApp,String id)
throws Exception
{
//	System.out.println ("*** get_message ***" + id);
	final ClientResponse response = myApp.callProcedure("Select",id);
	if (response.getStatus() != ClientResponse.SUCCESS){
		System.err.println(response.getStatusString());
		System.exit(-1);
	}

	final VoltTable results[] = response.getResults();
	if (results.length != 1) {
		System.out.printf("I can't say Hello in that language.");
		System.exit(-1);
	}

	VoltTable resultTable = results[0];
	VoltTableRow row = resultTable.fetchRow(0);
	System.out.printf("%s\t%s\t%s\t%s\n",
		id,
		row.getString("name"), 
		row.getString("population"),
		row.getString("date_mod"));
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
