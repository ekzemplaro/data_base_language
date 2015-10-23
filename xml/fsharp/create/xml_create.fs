// -------------------------------------------------------------------
//
//	xml_create.fs
//
//					Dec/19/2012
//
// -------------------------------------------------------------------
open System
open System.Text
open System.Data
open System.Xml

// -------------------------------------------------------------------
let record_gen_proc ((writer:XmlWriter),(key:string),(name:string),(population:int),(date_mod:string)) =
  writer.WriteStartElement (key)
  writer.WriteElementString ("name",name)
  writer.WriteElementString ("population",population.ToString ())
  writer.WriteElementString ("date_mod",date_mod)
  writer.WriteEndElement ()

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  let file_out = args.[0]

  printfn "*** 開始 ***"

  let writer = XmlTextWriter.Create (file_out)
  writer.WriteStartElement ("root")
  record_gen_proc (writer,"t2261","静岡",83145,"1997-9-27")
  record_gen_proc (writer,"t2262","浜松",72537,"1997-3-21")
  record_gen_proc (writer,"t2263","沼津",24863,"1997-8-18")
  record_gen_proc (writer,"t2264","三島",52916,"1997-2-29")
  record_gen_proc (writer,"t2265","富士",74171,"1997-10-20")
  record_gen_proc (writer,"t2266","熱海",21987,"1997-8-10")
  record_gen_proc (writer,"t2267","富士宮",14863,"1997-5-12")
  record_gen_proc (writer,"t2268","藤枝",48126,"1997-4-14")
  record_gen_proc (writer,"t2269","御殿場",74834,"1997-2-22")
  record_gen_proc (writer,"t2270","島田",94267,"1997-1-30")
  writer.WriteEndElement ()

  writer.Close ()
  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
