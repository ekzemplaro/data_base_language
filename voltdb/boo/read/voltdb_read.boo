// ----------------------------------------------------------------
//
//	voltdb_read.boo
//
//					Jan/31/2012
//
//
// ----------------------------------------------------------------
import System
import VoltDB.Data.Client

import System.Collections.Generic
// ----------------------------------------------------------------
def row_display_proc (connection as VoltConnection,key_in as String):
//	Select = connection.Procedures.Wrap<SingleRowTable,string>("Select")
//	result = Select.Execute(key_in).Result.Wrap<string,string,string,string>()
	Select = connection.Procedures.Wrap("Select")
	result = Select.Execute(key_in).Result.Wrap()

	if (result.HasData):
		Console.WriteLine("{0}\t{1}\t{2}\t{3}",result.Column1,result.Column2,result.Column3,result.Column4)
	else:
		Console.WriteLine("I can't say Hello in that language!")

// ----------------------------------------------------------------

print "*** 開始 ***"
keys = ["t3951","t3952","t3953","t3954","t3955", \
	"t3956","t3957","t3958","t3959"]

connection = VoltConnection.Create("hosts=localhost").Open()

for key in keys:
	row_display_proc (connection,key)

print "*** 終了 ***"


// ----------------------------------------------------------------
