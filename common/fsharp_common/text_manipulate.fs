// -------------------------------------------------------------------
//
//	text_manipulate.fs
//
//					Mar/09/2018
//
// -------------------------------------------------------------------
namespace text_manipulate
open System
open System.IO
open System.Text
open Microsoft.FSharp.Core
open System.Collections.Generic
// -------------------------------------------------------------------
module m01 = 
// -------------------------------------------------------------------
  let text_read_proc (file_in:string) =
//
    let lines = File.ReadAllLines(file_in)
    let list_aa = Seq.toList lines
//
    let dict_aa = new Dictionary<string,Dictionary<string,string>>()
    for line in list_aa do
      let cols = line.Split [|'\t'|]
      let key = cols.[0]
      let name = cols.[1]
      let population = cols.[2]
      let date_mod = cols.[3]
      let unit_aa = new Dictionary<string,string>()
      let _ = unit_aa.Add ("name",name)
      let _ = unit_aa.Add ("population", string population)
      let _ = unit_aa.Add ("date_mod",date_mod)
      dict_aa.Add (key,unit_aa)
    dict_aa
//
// -------------------------------------------------------------------
  let dict_display_proc (dict_aa:Dictionary<string,Dictionary<string,string>>) =
    let out_str = ref ""
    for kv in  dict_aa do
      let str_line = sprintf "%s\t%s\t%s\t%s\n" kv.Key kv.Value.["name"] kv.Value.["population"] kv.Value.["date_mod"]
      out_str := !out_str + str_line
      done
    printfn "%s" !out_str
    0

// -------------------------------------------------------------------
  let dict_append_proc (dict_aa:Dictionary<string,Dictionary<string,string>>,key:string,name_in:string,population_in,date_mod) =

    let unit_aa = new Dictionary<string,string>()
    let _ = unit_aa.Add ("name",name_in)
    let _ = unit_aa.Add ("population", string population_in)
    let _ = unit_aa.Add ("date_mod",date_mod)
    let _ = dict_aa.Add (key,unit_aa)

    dict_aa

// -------------------------------------------------------------------
  let dict_update_proc (dict_aa:Dictionary<string,Dictionary<string,string>>,key:string,population_in) =
    let dateNow = DateTime.Now
    let str_date = dateNow.ToString ()
    printfn "%s" str_date
    let unit_org = dict_aa.[key]
    let unit_aa = new Dictionary<string,string>()
    let _ = unit_aa.Add ("name",unit_org.["name"])
    let _ = unit_aa.Add ("population",string population_in)
    let _ = unit_aa.Add ("date_mod",str_date)
    let _ = dict_aa.Remove (key)
    let _ = dict_aa.Add (key,unit_aa)

    printfn "%A" unit_aa
    dict_aa

// --------------------------------------------------------------------
  let text_write_proc (file_out:string,dict_aa:Dictionary<string,Dictionary<string,string>>) =
    printfn "%s" file_out
    let cc = dict_aa.Count
    printfn "%A" cc
//
    let out_str = ref ""
    for kv in  dict_aa do
      let str_line = sprintf "%s\t%s\t%s\t%s\n" kv.Key kv.Value.["name"] kv.Value.["population"] kv.Value.["date_mod"]
      out_str := !out_str + str_line
      done
    printfn "%s" !out_str
    let fp_out = new StreamWriter (file_out)
    let _ = fp_out.Write (!out_str)
    let _ = fp_out.Close ()
    0
// --------------------------------------------------------------------
