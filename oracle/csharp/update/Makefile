COMMON=/var/www/data_base/common/csharp_common
oracle_update.exe : oracle_update.cs
	mcs oracle_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:System.Data.OracleClient
clean:
	rm -f *.exe
