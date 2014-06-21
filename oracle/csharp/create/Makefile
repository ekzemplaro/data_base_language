COMMON=/var/www/data_base/common/csharp_common
oracle_create.exe : oracle_create.cs
	gmcs oracle_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:System.Data.OracleClient
clean:
	rm -f *.exe
