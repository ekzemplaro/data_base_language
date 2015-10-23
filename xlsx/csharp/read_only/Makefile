NET45=/home/uchida/c_sharp/excel/ExcelDataReader-develop/output/net45
xlsx_read.exe: xlsx_read.cs
	mcs xlsx_read.cs \
		-r:System.Data \
		-r:$(NET45)/Excel.4.5.dll \
		-r:$(NET45)/ICSharpCode.SharpZipLib.dll
clean:
	rm -f *.exe
