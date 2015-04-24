EPPLUS=/home/uchida/c_sharp/excel/epplus
COMMON=/var/www/data_base/common/csharp_common
xlsx_read.exe: xlsx_read.cs
	mcs xlsx_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:$(EPPLUS)/EPPlus.dll
clean:
	rm -f *.exe
