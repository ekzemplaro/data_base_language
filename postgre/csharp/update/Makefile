COMMON=/var/www/data_base/common/csharp_common
postgre_update.exe : postgre_update.cs
	mcs postgre_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:Npgsql
clean:
	rm -f *.exe
