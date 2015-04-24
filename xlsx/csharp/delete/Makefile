EPPLUS=/home/uchida/c_sharp/excel/epplus
COMMON=/var/www/data_base/common/csharp_common
xlsx_delete.exe: xlsx_delete.cs
	mcs xlsx_delete.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:$(EPPLUS)/EPPlus.dll
clean:
	rm -f *.exe
