// -------------------------------------------------------------------
//
//	redis_create.fs
//
//					Aug/03/2011
//
// -------------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO

// -------------------------------------------------------------------
let redis_set_proc (rd: Redis, id: string, name: string, population: int,date_mod:string) =
  let json_new = kvalue_manipulate.json_create_proc (name,population,date_mod)

  rd.Set (string id,json_new)
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let rd = new Redis ("host_dbase",6379)

  redis_set_proc (rd,"t1851","福井",61875,"1997-8-26")
  redis_set_proc (rd,"t1852","敦賀",59326,"1997-3-17")
  redis_set_proc (rd,"t1853","小浜",48931,"1997-7-8")
  redis_set_proc (rd,"t1854","大野",37157,"1997-5-7")
  redis_set_proc (rd,"t1855","勝山",25642,"1997-9-2")
  redis_set_proc (rd,"t1856","鯖江",75758,"1997-1-8")
  redis_set_proc (rd,"t1857","あわら",85352,"1997-4-15")
  redis_set_proc (rd,"t1858","越前",15856,"1997-7-24")
  redis_set_proc (rd,"t1859","坂井",65915,"1997-10-20")


  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
