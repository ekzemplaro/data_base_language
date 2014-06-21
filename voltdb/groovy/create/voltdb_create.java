// --------------------------------------------------------------------
/*
	voltdb_create.java

						Jul/06/2011
*/
// --------------------------------------------------------------------
import org.voltdb.client.ClientFactory;

// --------------------------------------------------------------------
public class voltdb_create {

// --------------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

        /*
         * Instantiate a client and connect to the database.
         */
        org.voltdb.client.Client myApp;
        myApp = ClientFactory.createClient();
        myApp.createConnection("localhost");

        /*
         * Load the database.
         */

	myApp.callProcedure ("Insert","t3951","高知", "85678","2008-4-12");
	myApp.callProcedure ("Insert","t3952","室戸", "24891","2008-3-17");
	myApp.callProcedure ("Insert","t3953","安芸", "72674","2008-5-9");
	myApp.callProcedure ("Insert","t3954","南国", "48367","2008-7-15");
	myApp.callProcedure ("Insert","t3955","土佐", "13456","2008-8-24");

	myApp.callProcedure ("Insert","t3956","須崎", "84561","2008-9-17");
	myApp.callProcedure ("Insert","t3957","宿毛", "74572","2008-10-26");
	myApp.callProcedure ("Insert","t3958","土佐清水", "23493","2008-11-18");
	myApp.callProcedure ("Insert","t3959","四万十","56781","2008-2-24");

	System.out.println ("*** 終了 ***");

}
// --------------------------------------------------------------------
}
// --------------------------------------------------------------------

