// --------------------------------------------------------------------
//
//	json_manipulate.fs
//
//				Mar/09/2018
//
//
//
// --------------------------------------------------------------------
namespace json_manipulate
open System
open System.IO
open System.Text
open System.Collections.Generic

open Newtonsoft.Json
// --------------------------------------------------------------------
module m01 =
  let json_to_dict_proc (str_json:string) =
//    let dict_aa = new Dictionary<string,Dictionary<string,string>>()
    let dict_aa = JsonConvert.DeserializeObject<Dictionary<string,Dictionary<string,string>>> (str_json)
    dict_aa
// --------------------------------------------------------------------
  let file_write_proc (file_name:string,str_out:string) =
    0
// --------------------------------------------------------------------
