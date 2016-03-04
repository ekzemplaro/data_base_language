EPPLUS=/home/uchida/c_sharp/excel/epplus
COMMON=/var/www/data_base/common/csharp_common
xlsx_create.exe: xlsx_create.cs
	mcs xlsx_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:$(EPPLUS)/EPPlus.dll
clean:
	rm -f *.exe
