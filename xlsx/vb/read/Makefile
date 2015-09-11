NET45=/home/uchida/c_sharp/excel/ExcelDataReader-develop/output/net45
xlsx_read.exe: xlsx_read.vb
	vbnc -out:xlsx_read.exe xlsx_read.vb \
		-r:$(NET45)/Excel.4.5.dll \
		-r:$(NET45)/ICSharpCode.SharpZipLib.dll
	chmod +x xlsx_read.exe
clean:
	rm -f *.exe
