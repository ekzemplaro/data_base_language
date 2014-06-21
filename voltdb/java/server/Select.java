// --------------------------------------------------------------------
/*
	Select.java

						Jul/06/2011
*/
// --------------------------------------------------------------------

import org.voltdb.VoltTable;
import org.voltdb.VoltProcedure;
import org.voltdb.SQLStmt;
import org.voltdb.ProcInfo;

@ProcInfo(
    partitionInfo = "CITIES.ID: 0",
    singlePartition = true
)

public class Select extends VoltProcedure {

public final SQLStmt sql = new SQLStmt(
	"SELECT ID, NAME, POPULATION, DATE_MOD FROM CITIES " +
	" WHERE ID = ?;"
  );

public VoltTable[] run( String id) 
	throws VoltAbortException {
          voltQueueSQL( sql, id );
          return voltExecuteSQL();
      }
}

// --------------------------------------------------------------------
