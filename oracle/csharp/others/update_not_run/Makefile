COMMON=/var/www/uchida/data_base/common/csharp_common
oracle_update.exe : oracle_update.cs
	csc oracle_update.cs \
		$(COMMON)/table_manipulate.cs \
		/r:System.Data \
		/r:System.Data.OracleClient
clean:
	rm -f *.exe
