// -----------------------------------------------------------------
//
//	pdf_create.fs
//
//					Feb/14/2014
//
// -----------------------------------------------------------------
open System
open System.IO

open iTextSharp.text
open iTextSharp.text.pdf
// -----------------------------------------------------------------
let record_out_proc (cb:PdfContentByte,baseFont:BaseFont,ypos:float32,key:String,name:String, population:int,date_mod:String) =
  cb.BeginText ()

  cb.SetFontAndSize (baseFont,18.0f)

  cb.SetTextMatrix (1.0f,0.0f,0.0f,1.0f,20.0f,ypos)
  cb.ShowText (key)

  cb.SetTextMatrix (1.0f,0.0f,0.0f,1.0f,150.0f,ypos)
  cb.ShowText (name)

  cb.SetTextMatrix (1.0f,0.0f,0.0f,1.0f,300.0f,ypos)
  cb.ShowText (population.ToString ())

  cb.SetTextMatrix (1.0f,0.0f,0.0f,1.0f,400.0f,ypos)
  cb.ShowText (date_mod)

  cb.EndText ()

// -----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let pdf_file = args.[0]

  BaseFont.AddToResourceSearch("iTextAsian.dll")

  let doc_aa = new Document (PageSize.A4,30.0f,30.0f,30.0f,30.0f)

  let writer = PdfWriter.GetInstance (doc_aa,new FileStream (pdf_file, FileMode.Create))
  let _ = doc_aa.Open ()

  let baseFont = BaseFont.CreateFont ("HeiseiKakuGo-W5", "UniJIS-UCS2-H", BaseFont.NOT_EMBEDDED)

  let cb = writer.DirectContent

  let _ = record_out_proc (cb,baseFont,700.0f,"t2531","大津",81756,"1997-6-12")
  let _ = record_out_proc (cb,baseFont,680.0f,"t2532","草津",23491,"1997-8-18")
  let _ = record_out_proc (cb,baseFont,660.0f,"t2533","守山",69385,"1997-2-26")
  let _ = record_out_proc (cb,baseFont,640.0f,"t2534","栗東",42673,"1997-7-8")
  let _ = record_out_proc (cb,baseFont,620.0f,"t2535","野洲",37192,"1997-9-11")
  let _ = record_out_proc (cb,baseFont,600.0f,"t2536","甲賀",21598,"1997-3-15")
  let _ = record_out_proc (cb,baseFont,580.0f,"t2537","湖南",81476,"1997-8-21")
  let _ = record_out_proc (cb,baseFont,560.0f,"t2538","近江八幡",16532,"1997-10-30")
  let _ = record_out_proc (cb,baseFont,540.0f,"t2539","彦根",52193,"1997-11-24")
  let _ = doc_aa.Close ()

  printfn "*** 終了 ***"
  0

// -----------------------------------------------------------------

// -----------------------------------------------------------------
