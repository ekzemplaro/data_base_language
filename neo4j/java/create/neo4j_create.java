// ----------------------------------------------------------------------
/*
	neo4j_create.java

						May/23/2011
*/
// ----------------------------------------------------------------------
import org.neo4j.graphdb.Direction;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Node;
import org.neo4j.graphdb.RelationshipType;
import org.neo4j.graphdb.Transaction;
import org.neo4j.kernel.EmbeddedGraphDatabase;

// ----------------------------------------------------------------------
public class neo4j_create
{
	private static final String DB_PATH = "/var/tmp/neo4j-store";
	private static final String NAME_KEY_A = "id";
	private static final String NAME_KEY_B = "name";
	private static final String NAME_KEY_C = "population";
	private static final String NAME_KEY_D = "date_mod";

// ----------------------------------------------------------------------
private static enum ExampleRelationshipTypes implements RelationshipType
{
//        EXAMPLE
}

// ----------------------------------------------------------------------
public static void main( final String[] args )
{
	System.out.println ("*** 開始 ***");

        GraphDatabaseService graphDb = new EmbeddedGraphDatabase( DB_PATH );
        registerShutdownHook( graphDb );
        // Encapsulate some operations in a transaction
        Transaction tx = graphDb.beginTx();
        try
        {
		Node[] Node_aa = new Node[10];

		Node_aa[0] = graphDb.createNode();
		Node_aa[0].setProperty (NAME_KEY_A, "t4051" );
		Node_aa[0].setProperty (NAME_KEY_B, "福岡" );
		Node_aa[0].setProperty (NAME_KEY_C, "71482" );
		Node_aa[0].setProperty (NAME_KEY_D, "2008-9-24" );

		Node_aa[1] = graphDb.createNode();
		Node_aa[1].setProperty (NAME_KEY_A, "t4052" );
		Node_aa[1].setProperty (NAME_KEY_B, "北九州" );
		Node_aa[1].setProperty (NAME_KEY_C, "45482" );
		Node_aa[1].setProperty (NAME_KEY_D, "2008-5-17" );

		Node_aa[2] = graphDb.createNode();
		Node_aa[2].setProperty (NAME_KEY_A, "t4053" );
		Node_aa[2].setProperty (NAME_KEY_B, "大牟田" );
		Node_aa[2].setProperty (NAME_KEY_C, "36482" );
		Node_aa[2].setProperty (NAME_KEY_D, "2008-3-21" );

		Node_aa[3] = graphDb.createNode();
		Node_aa[3].setProperty (NAME_KEY_A, "t4054");
		Node_aa[3].setProperty (NAME_KEY_B, "久留米");
		Node_aa[3].setProperty (NAME_KEY_C, "46489");
		Node_aa[3].setProperty (NAME_KEY_D, "2008-7-15");

		Node_aa[4] = graphDb.createNode();
		Node_aa[4].setProperty (NAME_KEY_A, "t4055");
		Node_aa[4].setProperty (NAME_KEY_B, "直方");
		Node_aa[4].setProperty (NAME_KEY_C, "46489");
		Node_aa[4].setProperty (NAME_KEY_D, "2008-7-15");

		Node_aa[5] = graphDb.createNode();
		Node_aa[5].setProperty (NAME_KEY_A, "t4056");
		Node_aa[5].setProperty (NAME_KEY_B, "飯塚");
		Node_aa[5].setProperty (NAME_KEY_C, "36423");
		Node_aa[5].setProperty (NAME_KEY_D, "2008-10-9");

		Node_aa[6] = graphDb.createNode();
		Node_aa[6].setProperty (NAME_KEY_A, "t4057");
		Node_aa[6].setProperty (NAME_KEY_B, "田川");
		Node_aa[6].setProperty (NAME_KEY_C, "76486");
		Node_aa[6].setProperty (NAME_KEY_D, "2008-2-12");

		Node_aa[7] = graphDb.createNode();
		Node_aa[7].setProperty (NAME_KEY_A, "t4058");
		Node_aa[7].setProperty (NAME_KEY_B, "柳川");
		Node_aa[7].setProperty (NAME_KEY_C, "86487");
		Node_aa[7].setProperty (NAME_KEY_D, "2008-3-18");

		Node_aa[8] = graphDb.createNode();
		Node_aa[8].setProperty (NAME_KEY_A, "t4059");
		Node_aa[8].setProperty (NAME_KEY_B, "八女");
		Node_aa[8].setProperty (NAME_KEY_C, "16485");
		Node_aa[8].setProperty (NAME_KEY_D, "2008-9-21");


	for (Node nnx : Node_aa)
		{
		if (nnx != null)
			{
			data_out_proc (nnx);
			}
		}

        }
        finally
	{
	tx.finish();
	}

//	System.out.println( "Shutting down database ..." );
//	graphDb.shutdown();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
private static void data_out_proc (Node Node_in)
{
            String greeting = Node_in.getProperty (NAME_KEY_A) + "\t"
                + Node_in.getProperty( NAME_KEY_B ) + "\t";
            greeting += Node_in.getProperty (NAME_KEY_C) + "\t"
                + Node_in.getProperty( NAME_KEY_D );

            System.out.println (greeting);

}

// ----------------------------------------------------------------------
private static void registerShutdownHook( final GraphDatabaseService graphDb )
    {
        // Registers a shutdown hook for the Neo4j instance so that it
        // shuts down nicely when the VM exits (even if you "Ctrl-C" the
        // running example before it's completed)
        Runtime.getRuntime().addShutdownHook( new Thread()
        {
            @Override
            public void run()
            {
                graphDb.shutdown();
            }
        } );
    }
}
// ----------------------------------------------------------------------
