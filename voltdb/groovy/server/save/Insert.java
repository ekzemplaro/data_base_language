// --------------------------------------------------------------------
/*
	Insert.java

						Oct/01/2010
*/
// --------------------------------------------------------------------

import org.voltdb.*;

@ProcInfo(
    partitionInfo = "HELLOWORLD.ID: 0",
    singlePartition = true
)

// --------------------------------------------------------------------
public class Insert extends VoltProcedure {

// --------------------------------------------------------------------
public final SQLStmt sql = new SQLStmt
	("INSERT INTO HELLOWORLD VALUES (?,?,?,?);");

public VoltTable[] run (String id,
			String name,
			String population,
			String date_mod)
      throws VoltAbortException {
          voltQueueSQL (sql, id, name, population, date_mod );
          voltExecuteSQL ();
          return null;
      
}
// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
