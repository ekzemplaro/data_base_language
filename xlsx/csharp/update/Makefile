EPPLUS=/home/uchida/c_sharp/excel/epplus
COMMON=/var/www/data_base/common/csharp_common
xlsx_update.exe: xlsx_update.cs
	mcs xlsx_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:$(EPPLUS)/EPPlus.dll
clean:
	rm -f *.exe
