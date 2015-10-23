// ----------------------------------------------------------------
//
//	voltdb_read.fs
//
//					Jan/31/2012
//
//
// ----------------------------------------------------------------
open System
open VoltDB.Data.Client

open System.Collections.Generic
// ----------------------------------------------------------------
let row_display_proc (connection:VoltConnection,key_in:String) =
  let Select = connection.Procedures.Wrap<SingleRowTable,string>("Select")
  let result = Select.Execute(key_in).Result.Wrap<string,string,string,string>()

  if (result.HasData) then
    Console.WriteLine("{0}\t{1}\t{2}\t{3}",result.Column1,result.Column2,result.Column3,result.Column4)
  else
    Console.WriteLine("I can't say Hello in that language!")

// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let keys = [|"t3951","t3952","t3953","t3954","t3955","t3956","t3957","t3958","t3959";|]

  let connection:VoltConnection = VoltConnection.Create("hosts=localhost").Open()

  for key in keys do
    row_display_proc (connection,key)
  done

  printfn "*** 終了 ***"

  0

// ----------------------------------------------------------------
