// --------------------------------------------------------------------
/*
	Select.java

						Oct/01/2010
*/
// --------------------------------------------------------------------

import org.voltdb.*;

@ProcInfo(
    partitionInfo = "HELLOWORLD.ID: 0",
    singlePartition = true
)

public class Select extends VoltProcedure {

public final SQLStmt sql = new SQLStmt(
	"SELECT ID, NAME, POPULATION, DATE_MOD FROM HELLOWORLD " +
	" WHERE ID = ?;"
  );

  public VoltTable[] run( String id) 
      throws VoltAbortException {
          voltQueueSQL( sql, id );
          return voltExecuteSQL();
      }
}

// --------------------------------------------------------------------
