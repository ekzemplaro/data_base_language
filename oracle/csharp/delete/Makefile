COMMON=/var/www/data_base/common/csharp_common
oracle_delete.exe : oracle_delete.cs
	gmcs oracle_delete.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:System.Data.OracleClient
clean:
	rm -f *.exe
