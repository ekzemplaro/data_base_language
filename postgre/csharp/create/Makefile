COMMON=/var/www/data_base/common/csharp_common
postgre_create.exe : postgre_create.cs
	mcs postgre_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:Npgsql
clean:
	rm -f *.exe
