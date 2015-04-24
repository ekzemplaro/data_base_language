' --------------------------------------------------------
'
'	xlsx_read.vb
'
'			Apr/20/2015
'
' --------------------------------------------------------
Imports	System
Imports	System.IO
Imports	Excel
' --------------------------------------------------------
Module	xlsx_read

' --------------------------------------------------------
Sub Main()
	Dim clArgs() As String = Environment.GetCommandLineArgs()
	console.writeLine("*** 開始 ***")
	Dim file_xlsx As String = clArgs(1)
	console.writeLine (file_xlsx)


	Dim stream as FileStream = File.Open(file_xlsx,FileMode.Open,FileAccess.Read)

	Dim excelReader as IExcelDataReader = ExcelReaderFactory.CreateOpenXmlReader(stream)

	excelReader.IsFirstRowAsColumnNames = true

	While excelReader.Read()
		Dim  str_out as String = excelReader.GetString(0) + vbTab
		str_out += excelReader.GetString(1) + vbTab
		str_out += excelReader.GetString(2) + vbTab
		str_out += excelReader.GetString(3)

		Console.WriteLine (str_out)
	End While

	excelReader.Close()

	console.writeLine("*** 終了 ***")
End Sub

' --------------------------------------------------------
End Module
' --------------------------------------------------------
