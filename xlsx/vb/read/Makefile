NET20=/home/uchida/c_sharp/excel/ExcelDataReader-develop/output/net20
xlsx_read.exe: xlsx_read.vb
	vbnc2 -out:xlsx_read.exe xlsx_read.vb \
		-r:$(NET20)/Excel.dll \
		-r:$(NET20)/ICSharpCode.SharpZipLib.dll
	chmod +x xlsx_read.exe
clean:
	rm -f *.exe
