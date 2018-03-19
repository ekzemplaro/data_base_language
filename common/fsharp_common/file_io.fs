// --------------------------------------------------------------------
//
//	file_io.fs
//
//				Mar/09/2018
//
//
//
// --------------------------------------------------------------------
namespace file_io
open System
open System.IO
open System.Text
open System.Collections.Generic

// --------------------------------------------------------------------
module m01 =
  let file_to_str_proc (file_in:string):string =
    let lines = File.ReadAllLines(file_in)
    let str_out = ref ""
    for line in lines do
      str_out := !str_out + line
    !str_out
// --------------------------------------------------------------------
  let file_write_proc (file_out:string,str_out:string) =
    let fp_out = new StreamWriter (file_out)
    let _ = fp_out.Write (str_out)
    let _ = fp_out.Close ()
    0
// --------------------------------------------------------------------
