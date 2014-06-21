// --------------------------------------------------------------------
/*
	Insert.java

						Jul/06/2011
*/
// --------------------------------------------------------------------

import org.voltdb.VoltTable;
import org.voltdb.SQLStmt;
import org.voltdb.ProcInfo;
import org.voltdb.VoltProcedure;

@ProcInfo(
    partitionInfo = "CITIES.ID: 0",
    singlePartition = true
)

// --------------------------------------------------------------------
public class Insert extends VoltProcedure {

// --------------------------------------------------------------------
public final SQLStmt sql = new SQLStmt
	("INSERT INTO CITIES VALUES (?,?,?,?);");

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
